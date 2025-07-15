---
tags:
    - about
    - how to
    - mkdocs
    - getting started
---
# How to use the MKDocs Materials Documentation Platform
## Requirements

- [just](https://just.systems/man/en/packages.html)
    ``` bash
    cargo install just
    brew install just
    ```
- Python toolchain [uv](https://docs.astral.sh/uv/)
    ```bash
    curl -LsSf https://astral.sh/uv/install.sh | sh
    ```
- Create venv with `uv` and `just`
  ``` bash
  just venv-create
  ```

## Just file recipes

```bash
just --list
Available recipes:
    build                                  # Build HTML static site
    changelog                              # create the changelog of the project
    changelog-release version=git-tag      # create a release version of the project
    clean
    clean-build                            # Delete build folder
    clean-venv                             # Delete venv
    deploy                                 # Deploy on gh-pages
    info                                   # Information about the environment
    serve                                  # Build HTML static site and serve it locally
    uv-create requirements=env_export_file # Create new uv environment from old requirements.txt
    venv-create                            # Create virtual environment
    venv-export                            # Export the build environment to {{env_export_file}}
    venv-lock
```

## How to Build MKDocs locally
incremental build of the documentation and watching for file changes.  Served locally

```bash
just serve
```

all the outputs will be in `site` folder. Open the webpage[http://localhost:8000](http://localhost:8000)

## How to Build MKDocs

```bash
just build
```

all the outputs will be in `site` folder.

## Continuous Integration (CI)
The CI is done with Github Actions with the file `.github/workflows/action-mkdocs.yml` will run on each master commit and create a `site/` folder which will be pushed onto the branch `gh-pages` and consequently be used by github to displayed static html pages.
