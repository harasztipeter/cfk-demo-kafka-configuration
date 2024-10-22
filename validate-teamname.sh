#!/bin/bash


for file in cfk-demo/dev/*; do
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
