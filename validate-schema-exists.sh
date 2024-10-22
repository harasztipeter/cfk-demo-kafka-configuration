#!/bin/bash

FAILED=0

# Loop through all YAML files in cfk-demo/dev
for file in cfk-demo/dev/*.yaml; do
  if [ -f "$file" ]; then

    echo "Checking file $(basename -- "$file")"

    # Extract the schemas block using yq
    schemas=$(yq e '.schemas[]' "$file")

    schema_count=$(yq e '.schemas | length' "$file")
    for ((i = 0; i < schema_count; i++)); do
      # Get schema name and format
      name=$(yq e ".schemas[$i].name" "$file")
      format=$(yq e ".schemas[$i].format" "$file")

      # Set the correct file extension based on format
      if [ "$format" == "protobuf" ]; then
        extension="proto"
      else
        extension="$format"
      fi

      filepath="cfk-demo/schemas/$format/$name.$extension"

      # Check if the file exists
      if [ ! -f "$filepath" ]; then
        echo "Error: File for schema '$name' in format '$format' not found at '$filepath'"
        FAILED=1
      fi
    done
    echo "-------"
  fi
done

# Output result
if [ "$FAILED" -eq 1 ]; then
  echo "Schema validation failed."
else
  echo "All schema files validated successfully."
fi