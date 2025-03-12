#!/bin/bash

# Ensure the script exits immediately if a command exits with a non-zero status
set -e

# Read environment variables
DIR_DEPTH="${DIR_DEPTH}"  # Specifies how deep to search in the directory structure
INPUT_LIST=(${CHANGED_FILES})    # List of changed files from environment variables, converted to an array

# Initialize the JSON output with an empty 'include' array
OUTPUT='{"include": []}'

# Loop through each changed file path
for path in "${INPUT_LIST[@]}"; do
  # Determine the depth of the current file path based on the number of '/' characters
  DEPTH=$(echo "$path" | awk -F'/' '{print NF}')

  # Find subfolders at the required depth relative to the specified directory depth
  SUBFOLDERS=$(find "$path" -type d -mindepth $((DIR_DEPTH - DEPTH)) -maxdepth $((DIR_DEPTH - DEPTH)) 2>/dev/null || true)

  # Loop through each discovered subfolder
  for folder in $SUBFOLDERS; do
    # Extract workspace, region, and cluster names by splitting the folder path
    IFS='/' read -r workspace region cluster <<< "$folder"

    # Append extracted values to the JSON output using jq
    OUTPUT=$(echo "$OUTPUT" | jq --arg workspace "$workspace" --arg region "$region" --arg cluster "$cluster" \
    '.include += [{"workspace": $workspace, "region": $region, "cluster": $cluster}]')
  done
done

# Remove duplicate entries from the JSON output
OUTPUT=$(echo "$OUTPUT" | jq -c '.include |= unique')

# Print the final JSON output
echo "$OUTPUT"
