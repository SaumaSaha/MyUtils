#! /bin/bash

source convert_case.sh

PROJECT_NAME=$1

SRC_FILE_NAME="$PROJECT_NAME.js"
TEST_FILE_NAME="$PROJECT_NAME-test.js"
OBJECT_NAME="$(kabab_to_camel_case $PROJECT_NAME)"
DEMO_FILE_PATH="/Users/saumasaha/Workspace/JavaScript/demo-project-structure"


mkdir -p "$PROJECT_NAME/src" "$PROJECT_NAME/lib" "$PROJECT_NAME/test"

cp "$DEMO_FILE_PATH/src/demo-project.js" $PROJECT_NAME/src/$SRC_FILE_NAME

sed -e "s/object-name/$OBJECT_NAME/g"  -e "s/file-name/$PROJECT_NAME/g" "$DEMO_FILE_PATH/test/demo-project-test.js" > "$PROJECT_NAME/test/$TEST_FILE_NAME"

cp $DEMO_FILE_PATH/lib/* "$PROJECT_NAME/lib/"

cp "$DEMO_FILE_PATH/run-test.sh" "$PROJECT_NAME/run-test.sh"
sed -i "" "s/test-file-name/$TEST_FILE_NAME/g" "$PROJECT_NAME/run-test.sh"

cd $PROJECT_NAME

./run-test.sh

git init
git add .
git commit -m 'Created project structure with demo test passing'

