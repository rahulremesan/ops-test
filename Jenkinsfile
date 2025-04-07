node('server_build_slave') {
    try {
        // ANSI colors if needed
        String ANSI_GREEN = "\u001B[32m"
        String ANSI_NORMAL = "\u001B[0m"
        String ANSI_BOLD = "\u001B[1m"
        String ANSI_RED = "\u001B[31m"
        String ANSI_YELLOW = "\u001B[33m"

        ansiColor('xterm') {
            stage('Checkout') {
                cleanWs()
                checkout scm
                commit_hash = sh(script: 'git rev-parse --short HEAD', returnStdout: true).trim()
                env.commit_id = sh(script: "echo styria-flutter-web_${commit_hash}_${env.BUILD_NUMBER}", returnStdout: true).trim()
                echo "${env.commit_id}"
            }
        }

        stage('SonarQube analysis') {
            def scannerHome = tool 'sonar_scanner'
            withSonarQubeEnv('sonarqube') {
                sh "${scannerHome}/bin/sonar-scanner"
            }
        }

        stage('Quality Gate') {
            timeout(time: 1, unit: 'HOURS') {
                def qg = waitForQualityGate()
                if (qg.status != 'OK') {
                    error "Pipeline aborted due to quality gate failure: ${qg.status}"
                }
            }
        }

        stage('Deploy') {
            sh '''
                ansible-playbook /data/ansible/styria/styria-deploy/flutter-web/flutter-web-dev-deploy.yaml
            '''
        }

        stage('ArchiveArtifacts') {
            sh "echo ${commit_id} > commit_id.txt"
            archiveArtifacts "commit_id.txt"
            currentBuild.description = "${commit_id}"
        }
    } catch (err) {
        currentBuild.result = "FAILURE"
        // Add notification or logging here
        echo "${ANSI_RED}Build failed: ${err.message}${ANSI_NORMAL}"
        throw err
    } finally {
        // Cleanup tasks if needed
    }
}
