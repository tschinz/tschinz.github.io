---
tags:
    - coding
    - rust
    - rustdoc
---

# RustDoc

Documentation comment uses markdown for formatting. Documentation comment examples with be run as a test.

- Module-level docs `//!` - Describe what your crate does
- Function docs `///` - Document every public item
- Examples in docs - These run as tests!
- Use proper markdown - Headers, lists, code blocks
- Document panics - If a function can panic, document when

## Example 1

````rust
//! Fast and easy queue abstraction.
//!
//! Provides an abstraction over a queue.  When the abstraction is used
//! there are these advantages:
//! - Fast
//! - [`Easy`]
//!
//! [`Easy`]: http://thatwaseasy.example.com

/// This module makes it easy.
pub mod easy {

  /// Use the abstraction function to do this specific thing.
  pub fn abstraction() {}

  /// Adds one to the number given.
  ///
  /// # Examples
  ///
  /// ```
  /// let arg = 5;
  /// let answer = my_crate::add_one(arg);
  ///
  /// asser_eq!(6, answer);
  /// ```
  pub fn add_one(x: i32) -> i32 {
    x + 1
  }
}
````

## Example 2

```rust
//! # hello-world-lib
//!
//! A simple library for greeting people.
//!
//! ## Example
//!
//! Use the greet function like this:
//!
//!     use hello_world_lib::greet;
//!
//!     let message = greet("World");
//!     assert_eq!(message, "Hello, World!");

/// Greets a person by name.
///
/// # Arguments
///
/// * `name` - The name of the person to greet
///
/// # Examples
///
/// Basic usage:
///
///     use hello_world_lib::greet;
///
///     let message = greet("Alice");
///     assert_eq!(message, "Hello, Alice!");
///
pub fn greet(name: &str) -> String {
    format!("Hello, {}!", name)
}

/// A more advanced greeting with customization.
///
/// # Arguments
///
/// * `name` - The name of the person to greet
/// * `enthusiastic` - If true, adds exclamation marks
///
/// # Examples
///
/// With enthusiasm:
///
///     use hello_world_lib::greet_custom;
///
///     let message = greet_custom("Bob", true);
///     assert_eq!(message, "Hello, Bob!!!");
///
pub fn greet_custom(name: &str, enthusiastic: bool) -> String {
    if enthusiastic {
        format!("Hello, {}!!!", name)
    } else {
        format!("Hello, {}.", name)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_greet() {
        assert_eq!(greet("World"), "Hello, World!");
        assert_eq!(greet("Rust"), "Hello, Rust!");
    }

    #[test]
    fn test_greet_custom() {
        assert_eq!(greet_custom("Alice", false), "Hello, Alice.");
        assert_eq!(greet_custom("Bob", true), "Hello, Bob!!!");
    }

    #[test]
    fn test_empty_name() {
        assert_eq!(greet(""), "Hello, !");
    }
}
```

## Build the documentation

Build and open the documentation in the browser

```bash
cargo doc --open
```

Build the documentation with private items included and without external dependencies

```bash
cargo doc --no-deps --document-private-items
```

Build and open the documentation with all features enabled and without external dependencies

```bash
cargo doc --all-features --no-deps --open
```
