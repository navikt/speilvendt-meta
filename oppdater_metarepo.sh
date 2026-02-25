#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

meta init --force
while read -r project
do
  if [[ "$project" != "navikt/speilvendt-meta" ]]; then
      meta project import "${project#"navikt/"}" "git@github.com:$project".git
  fi
done < tbd/repositories/speilvendt_bomlo.txt

# Fjern duplikater fra .gitignore
sort --unique .gitignore --output .gitignore

echo 
source repoer_som_ikke_er_i_metarepo.sh
