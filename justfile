##################################################
# Variables
#
project_dir   := justfile_directory()
project_name  := file_stem(justfile_directory())

venv_dir        := ".venv"
env_file        := "pyproject.toml"
env_lock_file   := "uv.lock"
env_export_file := "requirements.txt"
source_dir      := "docs"
output_dir      := "site"
git-tag         := `git describe --tags --always`
year            := `date +%Y`
date            := `date +%Y-%m-%d`
builder         := "mkdocs"
builder_version := builder + " -V"

sourceVenv := if os() == "windows" {
  project_dir + "\\" + venv_dir + "\\Scripts\\activate.bat"
} else{
  "source " + project_dir + "/" + venv_dir + "/bin/activate"
}

##################################################
# COMMANDS
#
# List all commands
_default:
  just --list

# Information about the environment
@info:
  echo "Environment Informations"
  echo "========================"
  echo "    OS          : {{os()}}({{arch()}})"
  echo "    Projectdir  : {{project_dir}}"
  echo "    ----------------------------"
  echo "    ENV tool    : uv"
  echo "    VENV DIR    : {{venv_dir}}"
  echo "    ENV file    : {{env_file}}"
  echo "    LOCK file   : {{env_lock_file}}"
  echo "    EXPORT file : {{env_export_file}}"
  echo "    ----------------------------"
  echo "    Source dir  : {{source_dir}}"
  echo "    Output dir  : {{output_dir}}"
  echo "    ----------------------------"
  echo "    Builder     : `{{builder_version}}`"
  echo "    ----------------------------"
  echo "    Project Dependencies"
  uv tree

#-------------------------------------------------
# ENV RELATED
#
# Create new uv environment from old requirements.txt
uv-create requirements=env_export_file:
  # could get requirements from current pip freeze
  #pip freeze > {{requirements}}
  # create a new uv environment
  uv init .
  rm ./main.py
  uv venv {{venv_dir}}
  # install the requirements does not update pyproject.toml
  uv pip add -r {{requirements}}

# Create virtual environment
@venv-create:
  if [ -d ".venv/bin" ]; then \
    echo "venv already exists"; \
  else \
    uv venv {{venv_dir}};
  fi

# Export the build environment to {{env_export_file}}
@venv-export:
  uv export --format {{env_export_file}}

@venv-lock:
  uv lock

# create a release version of the project
changelog-release version=git-tag:
  git cliff --tag {{version}}
  git tag -a {{version}} -m "Release {{version}}"$

# create the changelog of the project
changelog:
  git cliff

# Build HTML static site
@build: venv-create
  #!/usr/bin/env bash
  {{sourceVenv}} && \
  {{builder}} build

# Build HTML static site and serve it locally
@serve: venv-create
  #!/usr/bin/env bash
  {{sourceVenv}} && \
  {{builder}} serve

# Deploy on gh-pages
@deploy: venv-create
  #!/usr/bin/env bash
  {{sourceVenv}} && \
  {{builder}} gh-deploy

# Delete build folder
[linux]
[macos]
@clean-build:
  rm -rf {{output_dir}}

[windows]
@clean-build:
  del {{output_dir}}

# Delete venv
[linux]
[macos]
@clean-venv:
  rm -rf {{venv_dir}}

[windows]
@clean-venv:
  del {{venv_dir}}

@clean: clean-build clean-venv
