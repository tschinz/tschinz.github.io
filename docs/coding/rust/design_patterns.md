---
tags:
  - coding
  - rust
  - design patterns
---

# Design Patterns

List of common and idiomatic design patterns in Rust. These patterns could be found in mutliple books and articles and also in the [Unofficial Rust Book](https://rust-unofficial.github.io/patterns/)

## Idioms

### Safely Unwrap `Option` and `Result`

Use `unwrap_or` to provide a default value when unwrapping an `Option` or `Result`.

```rust
let x = Some("value");
let y = x.unwrap_or("default");
assert_eq!(y, "value");

let x = None;
let y = x.unwrap_or("default");
assert_eq!(y, "default");
```

### Use `if let` to Unwrap `Option` and `Result`

Use `if let` to unwrap an `Option` or `Result` and execute code if the value is `Some` or `Ok`.

```rust
let x = Some("value");
if let Some(value) = x {
    assert_eq!(value, "value");
}

let x = None;
if let Some(value) = x {
    assert_eq!(value, "value");
}
```

### Use `match` to Unwrap `Option` and `Result`

Use `match` to unwrap an `Option` or `Result` and execute code based on the value.

```rust
let x = Some("value");
match x {
    Some(value) => assert_eq!(value, "value"),
    None => panic!("Expected Some"),
}

let x = None;
match x {
    Some(value) => assert_eq!(value, "value"),
    None => assert!(true),
}
```

### Avoid `unwrap()` on Options - Use Safe Alternatives

Instead of using `unwrap()` which can panic, use safer alternatives to handle `Option` values. This is especially important when you need to return a `Result` from your function.

**❌ Avoid this - panic on `None`:**

```rust
fn get_user() -> Option<String> {
    None // Simulating no user found
}

fn get_user_name() -> Result<String, String> {
    let user = get_user().unwrap(); // Panics if None!
    Ok(user)
}
```

**✅ Use these safer alternatives:**

#### Option 1: `let-else` (Recommended)

The most idiomatic and readable approach since Rust 1.65:

```rust
fn get_user_name() -> Result<String, String> {
    let Some(user) = get_user() else {
        return Err("User not found".to_string());
    };
    // Continue with user
    Ok(user)
}
```

#### Option 2: `ok_or` and `ok_or_else`

Convert `Option` to `Result` with custom error messages:

```rust
fn get_user_name() -> Result<String, String> {
    // ok_or: provide error value directly
    let user = get_user().ok_or("User not found".to_string())?;
    Ok(user)
}

fn get_user_with_context() -> Result<String, String> {
    // ok_or_else: use closure for expensive operations
    let user = get_user().ok_or_else(|| {
        log_error("User lookup failed");
        format!("User not found at {}", current_time())
    })?;
    Ok(user)
}
```

#### Option 3: Explicit `match`

More verbose but very clear for complex error handling:

```rust
fn get_user_name() -> Result<String, String> {
    let user = match get_user() {
        Some(user) => user,
        None => return Err("User not found".to_string()),
    };
    Ok(user)
}
```

#### When to use fallback values

Use `unwrap_or` and `unwrap_or_else` when you want fallback values instead of errors:

```rust
fn get_user_display_name() -> String {
    // Provide fallback value
    get_user().unwrap_or_else(|| "Anonymous".to_string())
}
```

**Why avoid `unwrap()`?**

1. **Runtime panics** - Your program crashes instead of handling errors gracefully
2. **Poor error messages** - Users get generic panic messages instead of helpful context
3. **Cascading failures** - One `unwrap()` encourages more, making code fragile
4. **Library unfriendly** - Library users can't handle errors from your functions

### Borrowed Types for Arguments

Preferr borrowed type over borrowing the owned type.

- `&str` over `&String`
- `&[T]` over `&Vec<T>`
- `&T` over `&Box<T>`

```rust
// this
fn three_vowels(word: &str) -> bool {}
// instead of this
fn three_vowels(word: &String) -> bool {}

```

### Use `format!` to work with Strings

```rust
let name = "John";
let greeting = format!("Hello, {}!", name);
```

### Constructor & Default Constructor

- _Constructor_ - Rust does not have a constructor method like other languages. Instead, you can use an associated function `new`to create an object.
- _Default Constructor_ - Can be implemented with the `Default` trait.

```rust
pub struct Second {
  value: u64,
}

impl Second {
  // Constructs a new instance of [`Second`].
  // Note this is an associated function - no self.
  pub fn new(value: u64) -> Self {
    Self { value }
  }

  /// Returns the value in seconds.
  pub fn value(&self) -> u64 {
    self.value
  }
}

impl Default for Second {
    fn default() -> Self {
        Self { value: 0 }
    }
}
```

The Default constructor can also be `derived` is all fields in the struct implement the `Default` trait.

```rust
#[derive(Default, Debug, PartialEq)]
pub struct Time {
    seconds: u64,
    minutes: u64,
    hours: u64,
}

impl Time {
    /// Returns the value in seconds.
    pub fn get_time(&self) -> (u64, u64, u64) {
        (self.seconds, self.minutes, self.hours)
    }
}

fn main() {
    // construct a new instance with default values
    let mut time_1 = Time::default();
    // do something with conf here
    time_1.seconds = 10;

    // partial initialization with default values, creates the same instance
    let time_2 = Time {
        seconds: 10,
        ..Default::default()
    };
    assert_eq!(time_1, time_2);
}
```

### Deconstructor

Rust does not offer a deconstructor method like other languages. Instead, you can implement the `drop` function to perform cleanup when the object goes out of scope.

```rust
struct Foo;

// Implement a destructor for Foo.
impl Drop for Foo {
    fn drop(&mut self) {
        println!("exit");
    }
}

fn main() {
    {
      let var = Foo;
    } // var dropped here
}
```

### Use Iterators rather then loops

Iterators in Rust are lazy and can prevent unnecessary memory allocations.

Indead of:

```rust
let mut squares = Vec::new();
for i in 0..1_000_000 {
    squares.push(i * i);
}
```

Do this:

```rust
let squares: Vec<_> = (0..1_000_000).map(|i| i * i).collect();
```

### Use `enum`s for State Management

It's often considered good practice to use custom types (such as enum) instead of raw bool values or integers. This makes the code more expressive, self-documenting, and type-safe.

**❌ Avoid using bool for complex state:**

```rust
fn set_user_status(active: bool) {
    if active {
        println!("User is active");
    } else {
        println!("User is inactive");
    }
}
fn main() {
    let status = true;
    set_user_status(status);
}
```

**✅ Use enums instead:**

```rust
use chrono::{DateTime, Utc};

#[derive(Debug, Clone)]
enum UserStatus {
    Active,
    Inactive,
    Suspended { reason: String },
    Banned { until: Option<DateTime<Utc>> },
}

fn set_user_status(status: UserStatus) {
    match status {
        UserStatus::Active => println!("User is active"),
        UserStatus::Inactive => println!("User is inactive"),
        UserStatus::Suspended { reason } => println!("User suspended: {}", reason),
        UserStatus::Banned { until } => match until {
            Some(date) => println!("User banned until: {}", date),
            None => println!("User permanently banned"),
        },
    }
}

fn main() {
    let status = UserStatus::Active;
    set_user_status(status);
}
```

1. _Better Readability_ – UserStatus::Active is more meaningful than true.
2. _Prevents Misuse_ – You cannot accidentally pass a bool that has an unclear meaning.
3. _Extensibility_ – You can easily add more states, like Banned, PendingApproval, etc.
4. _Stronger Type Safety_ – The compiler prevents incorrect values from being passed.

## Defensive Programming

From the blogpost of corrode.dev [Patterns for defensive Programming in Rust](https://corrode.dev/blog/defensive-programming/)
Defensive programming patterns help prevent bugs by leveraging Rust's type system and compiler to catch errors before they happen. These patterns make implicit invariants explicit and compiler-enforced.

### Avoid Vector Indexing - Use Pattern Matching

Direct indexing can panic at runtime if assumptions about the vector's length are wrong.

**❌ Fragile indexing:**

```rust
if !matching_users.is_empty() {
    let existing_user = &matching_users[0]; // Can panic if refactored carelessly
    // ...
}
```

**✅ Use slice pattern matching:**

```rust
match matching_users.as_slice() {
    [] => return Err("No users found".to_string()),
    [existing_user] => {
        // Safe! Compiler guarantees exactly one element
        // Use existing_user directly
    }
    [first, ..] => {
        // Handle multiple users case
        let existing_user = first;
    }
}
```

**Benefits:**

- Compiler enforces all cases are handled
- No risk of index out of bounds
- Forces you to consider edge cases (empty, single, multiple items)

### Avoid Lazy `Default` Usage

Using `..Default::default()` can hide bugs when new fields are added to structs.

**❌ Hidden field initialization:**

```rust
let config = Config {
    host: "localhost".to_string(),
    port: 8080,
    ..Default::default() // What fields are being set?
};
```

**✅ Explicit field initialization:**

```rust
let config = Config {
    host: "localhost".to_string(),
    port: 8080,
    timeout: Duration::from_secs(30),
    max_connections: 100,
    tls_enabled: false,
};
```

**Alternative - Destructure defaults:**

```rust
let Config {
    host: _,
    port: _,
    timeout,
    max_connections,
    tls_enabled,
} = Config::default();

let config = Config {
    host: "localhost".to_string(),
    port: 8080,
    timeout,      // Use default
    max_connections, // Use default
    tls_enabled,  // Use default
};
```

### Use Exhaustive Pattern Matching

Avoid catch-all patterns to ensure new enum variants are handled explicitly.

**❌ Fragile catch-all:**

```rust
match status {
    Status::Active => handle_active(),
    Status::Inactive => handle_inactive(),
    _ => {} // New variants might be ignored silently
}
```

**✅ Exhaustive matching:**

```rust
match status {
    Status::Active => handle_active(),
    Status::Inactive => handle_inactive(),
    Status::Suspended => handle_suspended(),
    Status::Banned => handle_banned(),
}
```

**For grouped handling:**

```rust
match status {
    Status::Active => handle_active(),
    Status::Inactive | Status::Suspended => handle_limited_access(),
    Status::Banned => handle_banned(),
}
```

### Use Descriptive Names Instead of `_`

Make pattern matching self-documenting by using descriptive names even for unused variables.

**❌ Unclear placeholders:**

```rust
match rocket {
    Rocket { _, _, payload } => launch_with_payload(payload),
}
```

**✅ Self-documenting patterns:**

```rust
match rocket {
    Rocket {
        has_fuel: _,
        crew_count: _,
        payload
    } => launch_with_payload(payload),
}
```

### Prefer `TryFrom` Over Fallible `From`

If conversion can fail, make it explicit with `TryFrom` instead of hiding failures in `From`.

**❌ Hidden failure in `From`:**

```rust
impl From<String> for UserId {
    fn from(s: String) -> Self {
        let id = s.parse().unwrap_or(0); // Hidden failure!
        UserId(id)
    }
}
```

**✅ Explicit failure with `TryFrom`:**

```rust
impl TryFrom<String> for UserId {
    type Error = ParseError;

    fn try_from(s: String) -> Result<Self, Self::Error> {
        let id = s.parse().map_err(ParseError::InvalidFormat)?;
        if id == 0 {
            return Err(ParseError::InvalidId);
        }
        Ok(UserId(id))
    }
}
```

### Force Constructor Usage with Private Fields

Prevent bypassing validation by making direct struct construction impossible.

**❌ Bypassable validation:**

```rust
pub struct User {
    pub name: String,
    pub age: u32,
}

impl User {
    pub fn new(name: String, age: u32) -> Result<Self, String> {
        if name.is_empty() {
            return Err("Name cannot be empty".to_string());
        }
        Ok(Self { name, age })
    }
}

// Validation can be bypassed!
let user = User { name: "".to_string(), age: 0 };
```

**✅ Enforced validation with private field:**

```rust
pub struct User {
    pub name: String,
    pub age: u32,
    _private: (), // Prevents external construction
}

impl User {
    pub fn new(name: String, age: u32) -> Result<Self, String> {
        if name.is_empty() {
            return Err("Name cannot be empty".to_string());
        }
        Ok(Self { name, age, _private: () })
    }
}
```

**Alternative with `#[non_exhaustive]`:**

```rust
#[non_exhaustive]
pub struct User {
    pub name: String,
    pub age: u32,
}
```

### Use Enums Instead of Boolean Parameters

Boolean parameters make code unreadable and error-prone at call sites.

**❌ Unclear boolean parameters:**

```rust
process_data(&data, true, false, true); // What do these mean?
```

**✅ Self-documenting enums:**

```rust
enum Compression { Enabled, Disabled }
enum Encryption { Enabled, Disabled }
enum Validation { Enabled, Disabled }

process_data(
    &data,
    Compression::Enabled,
    Encryption::Disabled,
    Validation::Enabled
);
```

**For complex configurations, use parameter structs:**

```rust
struct ProcessOptions {
    compression: Compression,
    encryption: Encryption,
    validation: Validation,
}

impl ProcessOptions {
    pub fn development() -> Self {
        Self {
            compression: Compression::Disabled,
            encryption: Encryption::Disabled,
            validation: Validation::Enabled,
        }
    }

    pub fn production() -> Self {
        Self {
            compression: Compression::Enabled,
            encryption: Encryption::Enabled,
            validation: Validation::Enabled,
        }
    }
}

// Usage
process_data(&data, ProcessOptions::production());
```

### Use `#[must_use]` for Important Types

Prevent callers from accidentally ignoring important return values.

```rust
#[must_use = "Configuration must be applied to take effect"]
pub struct Config {
    timeout: Duration,
}

impl Config {
    pub fn new() -> Self {
        Self { timeout: Duration::from_secs(30) }
    }

    pub fn with_timeout(mut self, timeout: Duration) -> Self {
        self.timeout = timeout;
        self
    }
}

// Compiler warns if Config is created but not used
let config = Config::new(); // Warning: Configuration must be applied to take effect

// Correct usage
let config = Config::new().with_timeout(Duration::from_secs(60));
apply_config(config);
```

### Temporary Mutability Pattern

Make mutability explicit and limited in scope.

```rust
// Simple shadowing
let mut data = get_initial_data();
data.sort();
data.dedup();
let data = data; // Now immutable

// Or use scope block for complex initialization
let processed_data = {
    let mut data = get_initial_data();
    let temp_results = compute_intermediate();
    data.extend(temp_results);
    data.sort();
    data // Return final immutable value
};
// temp_results not accessible here
```

### Defensive Clippy Lints

Enable these Clippy lints to automatically enforce defensive programming:

```rust
#![deny(clippy::indexing_slicing)]
#![deny(clippy::fallible_impl_from)]
#![deny(clippy::wildcard_enum_match_arm)]
#![deny(clippy::unneeded_field_pattern)]
#![deny(clippy::fn_params_excessive_bools)]
#![deny(clippy::must_use_candidate)]
```

Or in `Cargo.toml`:

```toml
[lints.clippy]
indexing_slicing = "deny"
fallible_impl_from = "deny"
wildcard_enum_match_arm = "deny"
unneeded_field_pattern = "deny"
fn_params_excessive_bools = "deny"
must_use_candidate = "deny"
```

**Key Principle:** Make implicit invariants explicit and compiler-enforced. The best bug is the one that never compiles in the first place.
