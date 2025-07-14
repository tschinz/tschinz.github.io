---
tags:
- tools
- anaconda
---
# Introduction

## Installing

macOS and Linux
```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

Windows
```powershell
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
```

## Convert a repo to use uv

```bash
# export existing environment
pip freeze > requirements.txt

# create a new uv project in the current directory
uv init .

# install the packages from requirements.txt
# only installs in environemnt won't touch pyproject.toml
uv pip install -r requirements.txt
```

## Init venv on a freshly cloned repo

```bash
uv venv [venv_dir]
```

## Activate venv

```bash
source .venv/bin/activate
```

## Install dependencies

```bash
uv add [package_name]
```
