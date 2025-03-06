---
tags:
- tools
- cli
- git
- git-cliff
- commits to changelog
---

![](img/git-cliff.png){align=right width="20%"}

# Git-Cliff: Automated Changelog Generation

Git-Cliff is a powerful tool for automatically generating changelogs from your Git commit history. By following a structured commit message convention, you can effortlessly create professional changelogs for your projects.

![](img/git-cliff.gif){.center width="80%"}

**Why git-cliff?**

- **Automated Changelog Generation**: Save time by generating changelogs directly from commit messages.
- **Customizable**: Define your own rules for grouping commits and formatting the changelog.
- **Supports Conventional Commits**: Works seamlessly with the widely-used [Conventional Commits](https://www.conventionalcommits.org/) standard.

## Commit Message Format

To get the best results with `git-cliff`, use the **Conventional Commit** format:

```raw
<type>(<scope>): <description>

<body>

<footer>
```

**Key Points:**

- **Type**: The category of the change (feat, fix, docs, etc.).
    - `feat`: A new feature or functionality.
    - `fix`: A bug fix.
    - `docs`: Changes to documentation only.
    - `style`: Code style changes (formatting, indentation, etc.) that do not affect behavior.
    - `refactor`: Code changes that neither fix bugs nor add features (e.g., code improvements).
    - `test`: Adding or modifying tests.
    - `chore`: Non-code tasks (e.g., build system, CI/CD changes).
    - `perf`: Performance optimization or improvements.
    - `build`: Changes to the build system or dependencies (e.g., upgrading dependencies).
    - `ci`: Changes to CI/CD configuration or scripts.
    - `revert`: Reverting a previous commit.
    - `config`: Updates to configuration files.
    - `deps`: Dependency updates (similar to build but specific to libraries/modules).
    - `hotfix`: Quick fixes for critical bugs (common in agile projects).
- **Scope**: The specific area/module impacted (optional).
    - `api`: API-related changes or endpoints.
    - `auth`: Authentication and authorization.
    - `db`: Database-related changes (e.g., schema updates).
    - `ui`: User interface components.
    - `ux`: User experience or design improvements.
    - `core`: Core functionality or utilities.
    - `docs`: Documentation updates or files.
    - `deps`: Dependency management (adding, removing, or updating libraries).
    - `config`: Configuration files or environment settings.
    - `build`: Build process or pipeline (e.g., webpack, Docker, Makefiles).
    - `ci`: Continuous Integration/Delivery pipelines.
    - `i18n`: Internationalization and localization.
    - `testing`: Testing frameworks or test cases.
    - `security`: Security updates or fixes.
    - `routing`: Routing and navigation logic.
    - `logging`: Logging and monitoring.
    - `metrics`: Application metrics and telemetry.
    - `styles`: Styling updates (e.g., CSS or theming).
    - `infra`: Infrastructure-related changes.
    - `deps`: Dependency changes (similar to build but more focused).
- **Description**: A short, imperative description of the change.
- **Body**: Additional context or motivation (optional).
- **Footer**: Notes for breaking changes or issue references (optional).

### Examples

**New Feature**

```raw
feat(ui): add dark mode toggle

Added a dark mode toggle to the settings menu, allowing users to switch
between light and dark themes.
```

**Bug Fix**
```raw
fix(api): resolve null pointer exception on login

Fixed an issue where the login API would throw a null pointer exception
if the email field was missing.
```

**Breaking Change**

```raw
feat(auth): migrate to OAuth2

BREAKING CHANGE: Updated the authentication system to use OAuth2.
Existing users must update their access tokens.
```

## Configuration

Here’s an example `.git-cliff.toml` configuration file to customize the changelog:

- [git-cliff-default.toml](docs/git-cliff-default.toml)
- [git-cliff-detailed.toml](docs/git-cliff-detailed.toml)

### My custom configuration

[git-cliff-custom.toml](docs/git-cliff-custom.toml)


Here some important parts of my custom configuration

```toml
# parse the commits based on https://www.conventionalcommits.org
conventional_commits = true
# filter out the commits that are not conventional
filter_unconventional = false
# process each line of a commit as an individual commit
split_commits = true
```

The regex parser is flexible and supporting different types

- `feat`, `feature`, `features`
- `fix`, `fixes`
- `doc`, `docs`
- `perf`, `performance`, `performances`
- `refactor`, `refactors`
- `style`, `styles`
- `chore`, `chores`
- `security`
- `revert`, `reverts`

As well as the legacy commits I did in the past

- `ADD`, `add`
- `CHG`, `chg`
- `REM`, `rem`
- `MOV`, `mov`
- `FIX`, `fix`
- `NOTE`, `note`
- `WARN`, `warn`

```
# regex for parsing and grouping commits
commit_parsers = [
  { message = "^feat(ure)?s?", group = "<!-- 0 -->🚀 Features" },
  { message = "^fix(es)?", group = "<!-- 1 -->🐛 Bug Fixes" },
  { message = "^docs?", group = "<!-- 3 -->📚 Documentation" },
  { message = "^perf(ormance)?s?", group = "<!-- 4 -->⚡ Performance" },
  { message = "^refactors?", group = "<!-- 2 -->🚜 Refactoring" },
  { message = "^styles?", group = "<!-- 5 -->🎨 Styling" },
  { message = "^tests?", group = "<!-- 6 -->🧪 Testing" },
  { message = "^chores?", group = "<!-- 7 -->⚙️ Miscellaneous Tasks" },
  { message = "^security", group = "<!-- 8 -->🛡️ Security" },
  { body = ".*security", group = "<!-- 8 -->🛡️ Security" },
  { message = "^reverts?", group = "<!-- 9 -->◀️ Revert" },

  # Conventional commit exclusions
  { message = "^chores?\\(releases?\\):", skip = true },
  { message = "^chores?\\(deps?.*\\)", skip = true },
  { message = "^chores?\\(pr\\)", skip = true },
  { message = "^chores?\\(pull\\)", skip = true },
  { message = "^chores?\\(version\\):", skip = true },

  # Legacy commit styles
  { message = "(?i)^ADD", group = "<!-- 0 -->🚀 Features" },
  { message = "(?i)^CHG", group = "<!-- 0 -->🚀 Features" },
  { message = "(?i)^REM", group = "<!-- 2 -->🚜 Refactoring" },
  { message = "(?i)^MOV", group = "<!-- 2 -->🚜 Refactoring" },
  { message = "(?i)^FIX", group = "<!-- 1 -->🐛 Bug Fixes" },
  { message = "(?i)^NOTE", group = "<!-- 10 -->💼 Other" },
  { message = "(?i)^WARN", group = "<!-- 8 -->🛡️ Security" },

  { message = ".*", group = "<!-- 10 -->💼 Other" },
]
```

## Getting started

- Install `git-cliff`
  ```bash
  cargo install git-cliff
  ```
- Initialise `git-cliff`
  ```bash
  git cliff --init
  ```
  or create a `.git-cliff.toml` file in your project directory.
- Generate: Run the following command to create a changelog:
  ```bash
  git cliff
  git cliff -o CHANGELOG.md
  git cliff --tag v0.1.1

  ```
