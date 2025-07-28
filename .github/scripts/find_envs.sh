#!/bin/bash
set -e

find_env() {
  local dir="$PWD"
  local list=()

  while [ "$dir" != "/" ]; do
    [ -f "$dir/env.tfvars" ] && list+=("$(realpath --relative-to="$PWD" "$dir/env.tfvars")")
    dir=$(dirname "$dir")
  done

  [ -f "/env.tfvars" ] && list+=("$(realpath --relative-to="$PWD" "/env.tfvars")")

  # Print args in reverse order separated by space, no trailing space
  local output=""
  for ((i=${#list[@]}-1; i>=0; i--)); do
    output+="-var-file=${list[i]} "
  done

  # Remove trailing space:
  printf '%s' "${output%" "}"
}

find_env
