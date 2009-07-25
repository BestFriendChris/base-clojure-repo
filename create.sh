#!/bin/sh

if [ $# -ne 3 ]; then
  echo "Usage: $0 clojure.jar clojure-contrib.jar folder-to-create"
  exit 1
fi

CLOJURE_JAR=$1
CLOJURE_CONTRIB_JAR=$2
FOLDER_TO_CREATE=$3

echo "  * Creating folder $FOLDER_TO_CREATE"
mkdir -p $FOLDER_TO_CREATE

echo "  * Moving template files"
cp -r template/* $FOLDER_TO_CREATE/
mkdir -p $FOLDER_TO_CREATE/libs

echo "  * Copying clojure jar"
cp $CLOJURE_JAR $FOLDER_TO_CREATE/libs

echo "  * Copying clojure-contrib jar"
cp $CLOJURE_CONTRIB_JAR $FOLDER_TO_CREATE/libs

echo "  * Creating .clj_completions file"
$FOLDER_TO_CREATE/clj create_clj_completions.clj $FOLDER_TO_CREATE
