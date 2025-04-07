#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Specify the Flutter version
FLUTTER_VERSION="3.24.3"

# Pull the Flutter Docker image with the specified version
echo "Pulling Flutter Docker image version ${FLUTTER_VERSION}..."
docker pull ghcr.io/cirruslabs/flutter:${FLUTTER_VERSION}

# Run Flutter build web command in a Docker container
echo "Running Flutter build..."
docker run --rm -v ${PWD}:/app -w /app ghcr.io/cirruslabs/flutter:${FLUTTER_VERSION} \
    /bin/bash -c "flutter --version && flutter pub get && flutter build web -v -t lib/main.dart"

# Check if build/web directory exists
if [ -d "build/web" ]; then
    echo "Build completed successfully. The 'build/web' folder is available in the project root."
    # Ensure the build directory has the correct permissions
    sudo chown -R $(id -u):$(id -g) build
else
    echo "Error: The 'build/web' folder was not created. The build process may have failed."
    echo "Please check the output above for any error messages."
fi

# Remove the Docker image after building
echo "Removing Flutter Docker image..."
docker rmi ghcr.io/cirruslabs/flutter:${FLUTTER_VERSION}

echo "Script completed."
