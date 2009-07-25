#!/bin/sh

if [ $# -ne 3 ]; then
  echo "Usage: $0 clojure.jar clojure-contrib.jar folder-to-create"
  exit 1
fi
./create.sh "$@"
FOLDER_TO_CREATE=$3

echo "  * Creating git repo"
pushd $FOLDER_TO_CREATE
git init
echo "target/" > $FOLDER_TO_CREATE/.gitignore
git add .
git commit -m "Initial import" --author="Automated Repo Creator <null@dev>"
