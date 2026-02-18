#!/opt/homebrew/bin/bash

set -euo pipefail
IFS=$'\n\t'

target_dir="$1"
cd "$target_dir" || exit 1
declare -A version_counts
declare -a lines=()

files=$(fd --no-ignore build.gradle.kts --max-depth=2 "$target_dir")
for filepath in $files; do
    version=$(rg -oP 'kotlin\("jvm"\) version "\K[0-9]+\.[0-9]+(\.[0-9]+)?' "$filepath" || echo "")
    if [[ -z "$version" ]]; then continue; fi

    if [[ -z "${version_counts[$version]:-}" ]]; then
        version_counts["$version"]=1
    else
        ((version_counts["$version"]++))
    fi

    lines+=("version: $version, path: $(realpath "$filepath")")
done

printf '%s\n' "${lines[@]}" | sort --version-sort --reverse

echo
# echo "Totalt: $total"
for version in "${!version_counts[@]}"; do
    printf '%s\t%s\n' "$version" "${version_counts[$version]}"
done | sort --version-sort --reverse | awk -F '\t' '{ printf "Kotlin %s: %s\n", $1, $2 }'
