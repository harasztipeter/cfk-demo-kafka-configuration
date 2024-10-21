#!/bin/bash

# todo loop 

# "cfk-demo/dev/*"
ROOT_FOLDER="cfk-demo"

STAGE_DEV="dev"
STAGE_INT="int"
STAGE_PROD="prod"

DEV_DIR="${ROOT_FOLDER}/${STAGE_DEV}/*"
INT_DIR="${ROOT_FOLDER}/${STAGE_INT}/*"
PROD_DIR="${ROOT_FOLDER}/${STAGE_PROD}/*"

for file in $DEV_DIR $INT_DIR $PROD_DIR; do
  if [ -f "$file" ]; then
    
    # extract filename
    filename_ext=$(basename -- "$file")
    filename="${filename_ext%.*}"

    TEAM_NAME=$(yq e '.teamname' "$file")
    if [ -n "$TEAM_NAME" ] && [ "$TEAM_NAME" != "$filename" ]; then
          FAILED=1
          echo "Filename '$filename' does not match team_name $TEAM_NAME"
    fi

  fi
done