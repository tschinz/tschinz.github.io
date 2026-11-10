##################################################
# Variables
#
project_dir := justfile_directory()
venv_dir    := ".venv"
source_dir  := "docs"
output_dir  := "site"
cache_dir   := ".cache"
git-tag     := `git describe --tags --always`

##################################################
# COMMANDS
#
# List all commands
_default:
  just --list

# Information about the environment
@info:
  echo "OS          : {{os()}}({{arch()}})"
  echo "Projectdir  : {{project_dir}}"
  echo "Source dir  : {{source_dir}}"
  echo "Output dir  : {{output_dir}}"
  echo "Builder     : `uv run zensical --version`"
  echo "----------------------------"
  uv tree --depth 1

#-------------------------------------------------
# ENV RELATED
#
# Create or update the virtual environment from uv.lock
@venv-create:
  uv sync

# Upgrade all dependencies to their latest allowed versions
@venv-upgrade:
  uv sync --upgrade

# Add a dependency, e.g. `just add plantuml-markdown`
@add package:
  uv add {{package}}

# Remove a dependency
@remove package:
  uv remove {{package}}

#-------------------------------------------------
# BUILD
#
# Build HTML static site
@build: venv-create
  uv run zensical build

# Build HTML static site and serve it locally
@serve: venv-create
  uv run zensical serve

#-------------------------------------------------
# CHANGELOG
#
# create a release version of the project
changelog-release version=git-tag:
  git cliff --tag {{version}}
  git tag -a {{version}} -m "Release {{version}}"

# create the changelog of the project
changelog:
  git cliff

#-------------------------------------------------
# CHECKS
#
# check all links
@lychee:
  lychee --exclude-all-private README.md docs/* --accept 100..=103,200..=299,403

#-------------------------------------------------
# CLEAN
#
# Delete build folder and build cache
@clean-build:
  rm -rf {{output_dir}} {{cache_dir}}

# Delete venv
@clean-venv:
  rm -rf {{venv_dir}}

# Delete build folder, build cache and venv
@clean: clean-build clean-venv
