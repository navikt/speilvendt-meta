# https://just.systems
# Installer just med brew install just

default:
    @just --list

# Installerer verktøy som blir brukt i andre kommandoer
bootstrap:
    @/opt/homebrew/bin/bash --version > /dev/null 2>&1  || brew install bash
    @fd --version > /dev/null 2>&1  || brew install fd
    @rg --version > /dev/null 2>&1  || brew install ripgrep

# Git pull i alle repoer
pull:
    meta exec "git pull" --parallel

# Viser alle endringer som ikke er comitted
list-uncommitted:
    meta exec "git status --short | cat" --parallel

# Viser alle versjoner av gradle
version-gradle: bootstrap
    script/version-gradle.sh {{ justfile_directory() }}

# Viser alle versjoner av kotlin
version-kotlin: bootstrap
    script/version-kotlin.sh {{ justfile_directory() }}