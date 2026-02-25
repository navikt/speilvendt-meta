#!/bin/bash

ALLOWED_FOLDERS=("script" ".git")

is_allowed() {
  local folder="$1"
  for allowed in "${ALLOWED_FOLDERS[@]}"; do
    [[ "$folder" == "$allowed" ]] && return 0
  done
  return 1
}

is_in_meta() {
  grep -q "\"$1\"" .meta
}

folders=$(find . -maxdepth 1 -type d ! -name '.' ! -name '..*' | sed 's|^\./||' | sort)

missing=""
while read -r folder; do
  if ! is_allowed "$folder" && ! is_in_meta "$folder"; then
    missing+="- $folder\n"
  fi
done <<< "$folders"

if [[ -n "$missing" ]]; then
  echo "Mapper som IKKE er i .meta - vurder å slette disse:"
  echo "==================================================="
  echo -e "$missing"
fi
