import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/molecules/cards/project_description_card.dart';
import 'package:styria_flutter_web/design_system/molecules/cards/project_info_card.dart';

class ProjectDetailsCard extends StatelessWidget {
  const ProjectDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ProjectDescriptionCard(
            projectLogo:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB6nfSLyWbQIxUvY_gpjVAFg0-RVbVnzl4yrWGam136s494dc1pQgVnZkltYamTkiUpCY&usqp=CAU',
            title: 'iGOT Karmayogi - Product',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
            healthIcon: Icons.sentiment_satisfied_outlined,
            iconColor: Colors.green,
          ),
          ProjectInfoCard(
            hoursSpend: '12453.45',
            hoursEstimated: '15000',
            startDate: DateTime(2020, 4, 21),
            endDate: DateTime(2020, 8, 21),
            department: 'NXT',
            client: 'Gate Foundation',
            domain: 'Government',
            geography: 'India',
            releaseVersion: 'FRAC v8',
            nextRelease: DateTime(2021, 8, 21),
          ),
        ],
      ),
    );
  }
}
