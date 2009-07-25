#!/bin/sh

if [ $# -ne 3 ]; then
  echo "Usage: $0 clojure.jar clojure-contrib.jar folder-to-create"
  exit 1
fi
./create.sh "$@"
FOLDER_TO_CREATE=$3

echo "  * Creating hg repo"
hg init $FOLDER_TO_CREATE
echo "^target/" > $FOLDER_TO_CREATE/.hgignore
hg -R $FOLDER_TO_CREATE ci -A -m "Initial import" -u "Automated Repo Creator"
