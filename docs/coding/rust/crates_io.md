---
tags:
    - coding
    - rust
    - cargo
    - crates.io
    - publish
---

# Publishing Crate at [crates.io](https://crates.io)

![](img/crates.io.svg){.center width="20%"}

Unter [crates.io](https://crates.io) you can publish either binary or library crates.

Binary crates can be installed via:

```bash
cargo install <crate_name>
```

Library crates can be added to a project via:

```bash
cargo add <crate_name>
```

## Prerequisites

- Rust installed - Install from [rustup.rs](https://rustup.rs)
- Git installed - Download from [git-scm.com](https://git-scm.com)
- GitHub account - Sign up at [github.com](https://github.com)

### Cargo helper tools

```bash
rustup component add clippy  # Install clippy
rustup component add rustfmt # Install rustfmt
cargo install cargo-audit    # Install cargo-audit
```

Unter [crates.io](https://crates.io) generate a accesstoken for yourdevice and enter it via the command line

```bash
cargo login <api token>
```

## Crate

### Metadata

```toml title="Cargo.toml"
[package]
name = "md-pdf"
version = "0.1.0"
edition = "2024"
authors = ["tschinz"]
license = "MIT"
description = "Convert markdown files to PDF using typst with templating"
readme = "README.md"
repository = "https://github.com/tschinz/md-pdf"
categories = ["command-line-utilities", "multimedia", "template-engine"]
keywords = ["markdown", "pdf", "typst", "converter", "templating"]
exclude = [
  ".github"
]
```

### Essential Files

- [Cargo.toml](https://github.com/tschinz/md-pdf/blob/main/Cargo.toml)
- [README.md](https://github.com/tschinz/md-pdf/blob/main/README.md)
- [LICENSE](https://github.com/tschinz/md-pdf/blob/main/LICENSE)
- [CHANGELOG.md](https://github.com/tschinz/md-pdf/blob/main/CHANGELOG.md) generated with git-cliff via [cliff.toml](https://github.com/tschinz/md-pdf/blob/main/cliff.toml)
- [.gitignore](https://github.com/tschinz/md-pdf/blob/main/.gitignore)
- Code
    - `src/main.rs` (for binary crates)
    - `src/lib.rs` (for library crates)
    - Rustdoc
        - Module-level docs (`//!`) - Describe what your crate does
        - Function docs (`///`) - Document every public item
        - Examples in docs - These run as tests!
        - Use proper markdown - Headers, lists, code blocks
        - Document panics - If a function can panic, document when

## Local Developement

```bash
# Run all tests
cargo test

# Run clippy
cargo clippy

# Format code
cargo fmt --all

# Build documentation
cargo doc --open

# Test documentation examples
cargo test --doc

# Run benchmarks (if available)
cargo bench

# Run security audit
cargo audit

# Test Publishing
cargo publish --dry-run
```

## Publish crate

```
# 1. Ensure you're on the main branch
git checkout main
git pull origin main

# 2. Verify all changes are committed
git status

# 3. Run all tests
cargo test --all-features

# 4. Run clippy
cargo clippy --all-features -- -D warnings

# 5. Check formatting
cargo fmt --all -- --check

# 6. Build documentation
cargo doc --all-features --no-deps

# 7. Dry-run publish
cargo publish --dry-run

# 8. Create an annotated tag
git tag -a v0.1.0 -m "Release version 0.1.0"

# 9. Verify the tag was created
git tag -l

# 10. View tag details
git show v0.1.0

# 11. Push the tag to GitHub
git push origin v0.1.0

# 12. Publish the crate to [crates.io](https://crates.io)
cargo publish
```

## Yank a version

Disallow the download of a specific crate version in [crates.io](https://crates.io)

```bash
cargo yank --vers 1.0.0
```
