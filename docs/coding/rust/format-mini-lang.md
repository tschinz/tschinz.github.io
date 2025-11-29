---
tags:
  - coding
  - rust
  - syntax
  - println!()
  - format!()
  - print!()
  - format mini language
---

# `format!()`, `println!()`and `print!()` Macros

These marcos are a very powerful tool to format strings. `format!()` formats a string and returns it, `println!()` prints the formatted string to the console and `print!()` does the same but without a newline.

The Rust documentation provides a good overview of the formatting syntax: [std::fmt](https://doc.rust-lang.org/std/fmt/).

```rust
format!(format_string, arguments...)
```

### Formatting

```
formatting = [argument][:][[fill]align][sign][#][0][width][.precision][type]
argument   = integer | identifier
fill       = <any character>
align      = "<" | ">" | "^"
sign       = "+"
"#"        = alternate formatting
"0"        = zero-padding
width      = integer
precision  = integer
type       = "b" | "o" | "x" | "X" | "e" | "E" | "p" | "?"
```

```
"{" [argument][":"][[fill]align][sign]["#"]["0"][width][.precision][type] "}"
        /             /    /      /    /    /                \        \
       /             /    /      /    /    |                  \        \
      /             /    /      /    /     |- padding "0"      \        |
     /             /    /      /    |                           \       |
    /             /    /      |     |- alternate formatting      \      |
   /             /    /       |     |- (human-reable)             \     |
  /             /    /        |                                    |    |
 |             /    /         |- "" - default                      |    |
 |            /    /          |- + - + prefix        by tschinz    |    |
 |           /    |                                                |    |
 |          /     |                  nbr of descendants - integer -|    |
 |         |      |                                                     |
 |         |      |- < - left (default)      "" - default follows type -|
 |         |      |- > - right              "b" - binary ---------------|
 |         |      |- ^ - center             "o" - octal ----------------|
 |         |                                "x" - hex ------------------|
 |         |- any character for padding     "X" - Hex ------------------|
 |                                          "e" - scientific -----------|
 |- "" - follows arg sequence (default)     "E" - Scientific -----------|
 |- integer - selects arg by position       "p" - pointer addr ---------|
 |- identifier - selects arg by name        "?" - debug (trait req) ----|
```

### Arguments

```rust
let s = format!("Hello, {}, the answer is {}", "Alice", 42);                  // Positional Arguments
let s = format!("Hello, {name}, the answer is {age}", name = "Bob", age = 7); // Named Arguments
let s = format!("{0} is {1} years old. {0} loves Rust!", "Carol", 25);      // Reusing Arguments
```

### Align

Align a text on a given width

```rust
format!("{:<8}", 1);  // 1....... - left   aligned
format!("{:>8}", 1);  // .......1 -  right aligned
format!("{:^8}", 1);  // ...1.... - center aligned
```

### Padding

For `0` there are tow padding possibilities. The `0` and `0+`. The `0` padding is only allowed for numeric types and the `0+` padding is only allowed for signed numeric types.

```rust
format!("{:*<8}", 1); // 1******* - left  align, padding "*"
format!("{:0>8}", 1); // 00000001 - right align, padding "0"
format!("{:>08}", 1); // 00000001 - right align, padding leading "0"
format!("{: >8}", 1); //        1 - right align, padding " "
format!("{:#^8}", 1); // ###1#### - right align, padding "#"
```

### Sign

Only the "+" sign is allowed for the sign. For the "-" sign simply use a negative value

```rust
format!("{:>+8}", 1);   //       +1 - right align, sign +
format!("{:>8}", -1);   //       -1 - right align, sign -
format!("{:>+#08}", 1); // +0000001 - right align, sign +, padding leading "0"
format!("{:0>+#8}", 1); // 000000+1 - right align, padding "0", sign +
```

### Precision

Number of digits of floating point numbers

```rust
format!("{:>8.0}", E); //        3  - right align, 0 digit precision
format!("{:>8.1}", E); //      2.7  - right align, 1 digit precision
format!("{:>8.2}", E); //     2.72  - right align, 2 digit precision
format!("{:>8.3}", E); //    2.718  - right align, 3 digit precision
format!("{:>8.4}", E); //   2.7183  - right align, 4 digit precision
format!("{:>8.5}", E); //  2.71828  - right align, 5 digit precision
format!("{:>8.6}", E); // 2.718282  - right align, 6 digit precision
format!("{:>8.7}", E); // 2.7182818 - right align, 7 digit precision
```

### Type

Display a value in a specific format

```rust
format!("{:}", E as u32);        // 2                     - Integer (follows type)
format!("{:}", E);               // 2.718281828459045     - Float (follows type)
format!("{:b}", 49374);          // 1100000011011110      - Binary
format!("{:#b}", 49374);         // 0b1100000011011110    - Binary alternative (adds "0b")
format!("{:#034b}", 49374);      // 0b00000000000000001100000011011110 - Binary 32bit (adds "0b" and 32 digits)
format!("{:o}", 49374);          // 140336                - Octal
format!("{:#o}", 49374);         // 0o140336              - Octal alternative (adds "0o")
format!("{:#018o}", 49374);      // 0o0000000000140336    - Octal 16 digits (adds "0o" and 16 digits)
format!("{:x}", 49374);          // c0de                  - Hex lower case
format!("{:#x}", 49374);         // 0xc0de                - Hex lower case alternative (adds "0x")
format!("{:#010x}", 49374);      // 0x0000c0de            - Hex 8 digits (adds "0x" and 8 digits)
format!("{:X}", 49374);          // C0DE                  - Hex upper case
format!("{:#X}", 49374);         // 0xC0DE                - Hex upper case alternative (adds "0X")
format!("{:#010X}", 49374);      // 0x0000C0DE            - Hex 8 digits (adds "0X" and 8 digits)
format!("{:e}", E.powf(123.0));  // 2.6195173187490456e53 - Scientific notation lower case (adds "e")
format!("{:E}", E.powf(123.0));  // 2.6195173187490456E53 - Scientific notation upper case (adds "E")
format!("{:p}", &1);             // 0x1021872c0           - Pointer address
// ? requires the Debug trait to be implemented for the type
format!("{:?}", vec![1, 2, 3]);  // [1, 2, 3]             - Compact Debug Format (single line)
format!("{:#?}", vec![1, 2, 3]); // [                     - Pretty Debug Format (human-readable)
                                 //     1,
                                 //     2,
                                 //     3,
                                 // ]
```

### Examples

```rust
format!("{0:.>+10.3e}",E);   // ..+2.718e0 - right align, padding ".", sign "+", 10 width, 3 digit precision, scientific notation
format!("{0:#010x}", 49374); // 0x0000c0de - padding leading "0", 8 digits, Hex lower case alternative (adds "0x")
```
