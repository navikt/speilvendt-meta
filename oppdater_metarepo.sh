meta init --force
while read -r project
do
  if [[ "$project" != "navikt/speilvendt-meta" ]]; then
      meta project import "${project#"navikt/"}" "git@github.com:$project".git
  fi
done < tbd/repositories/speilvendt_bomlo.txt

# Fjern duplikater fra .gitignore
echo "$(sort -u .gitignore | cat -n | sort -nk1 | cut -f2-)" > .gitignore
