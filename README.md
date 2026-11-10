<h1 align="center">
  <br>
  <img src="./docs/img/logo.svg" alt="Zentauri Logo" width="250">
  <br>
  Zentauri Knowledge Database
  <br>
</h1>

This is the static [Zensical](https://zensical.org) documentation for myself

![Github Pages Deploy](https://github.com/tschinz/tschinz/actions/workflows/action-zensical.yml/badge.svg)
[![GitHub Sponsors](https://img.shields.io/github/sponsors/tschinz?logo=githubsponsors&label=Sponsor&color=ea4aaa)](https://github.com/sponsors/tschinz)

# How to use the Zensical Documentation Platform
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
    add package                       # Add a dependency, e.g. `just add plantuml-markdown`
    build                             # Build HTML static site
    changelog                         # create the changelog of the project
    changelog-release version=git-tag # create a release version of the project
    clean                             # Delete build folder, build cache and venv
    clean-build                       # Delete build folder and build cache
    clean-venv                        # Delete venv
    info                              # Information about the environment
    lychee                            # check all links
    remove package                    # Remove a dependency
    serve                             # Build HTML static site and serve it locally
    venv-create                       # Create or update the virtual environment from uv.lock
    venv-upgrade                      # Upgrade all dependencies to their latest allowed versions
```

## How to Build locally
incremental build of the documentation and watching for file changes.  Served locally

```bash
just serve
```

all the outputs will be in `site` folder. Open the webpage[http://localhost:8000](http://localhost:8000)

## How to Build

```bash
just build
```

all the outputs will be in `site` folder.

## Continuous Integration (CI)
The CI is done with Github Actions with the file [action-zensical.yml](./.github/workflows/action-zensical.yml) will run on each master commit and create a `site/` folder which will be pushed onto the branch `gh-pages` and consequently be used by github to displayed static html pages.

## Support

If you find this knowledge base useful, consider supporting it via [GitHub Sponsors](https://github.com/sponsors/tschinz). :heart:
