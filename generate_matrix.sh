#!/bin/bash

# Ensure the script exits on failure
set -e

# Read environment variables
DIR_DEPTH="${MATRIX_DIR_DEPTH}"
INPUT_LIST=(${CHANGED_FILES})  # Expecting CHANGED_FILES as space-separated string

# Initialize the JSON output
OUTPUT='{"include": []}'

for path in "${INPUT_LIST[@]}"; do
  DEPTH=$(echo "$path" | awk -F'/' '{print NF}')
  SUBFOLDERS=$(find "$path" -type d -mindepth $((DIR_DEPTH - DEPTH)) -maxdepth $((DIR_DEPTH - DEPTH)) 2>/dev/null || true)

  for folder in $SUBFOLDERS; do
    IFS='/' read -r workspace region cluster <<< "$folder"
    OUTPUT=$(echo "$OUTPUT" | jq --arg workspace "$workspace" --arg region "$region" --arg cluster "$cluster" \
    '.include += [{"workspace": $workspace, "region": $region, "cluster": $cluster}]')
  done
done

# Ensure unique entries in the matrix
OUTPUT=$(echo "$OUTPUT" | jq -c '.include |= unique')

# Return JSON output
echo "$OUTPUT"
