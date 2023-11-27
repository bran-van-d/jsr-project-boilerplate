# Replace the variables below with your GitHub username, repository name, branch, and directory path
GITHUB_USERNAME="bran-van-d"
REPO_NAME="demo-jsr-repo"
BRANCH_NAME="main"
DIRECTORY_PATH="jsr-modules/src/components/modules/$1"

# Create a temporary directory to store the downloaded zip file
TEMP_DIR=$(mktemp -d)

# Download the specific directory as a zip file from GitHub using curl
curl -L -o "$TEMP_DIR/$REPO_NAME.zip" "https://github.com/$GITHUB_USERNAME/$REPO_NAME/archive/$BRANCH_NAME.zip"

# Extract the downloaded zip file to get the specific directory
unzip -q "$TEMP_DIR/$REPO_NAME.zip" "$REPO_NAME-$BRANCH_NAME/$DIRECTORY_PATH*" -d "$TEMP_DIR"

# Move the desired directory to the current directory or any desired location
mv "$TEMP_DIR/$REPO_NAME-$BRANCH_NAME/$DIRECTORY_PATH" ./components/modules/

# Clean up: Remove the temporary directory
rm -rf "$TEMP_DIR"
