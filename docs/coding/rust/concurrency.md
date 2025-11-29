---
tags:
  - coding
  - rust
  - concurrency
  - threads
---

# Concurrency

Rust provides a powerful and safe concurrency model. It is built on the principles of ownership and borrowing, which prevent data races at compile time.

There are two main approaches to concurrency in Rust:

- **Threads**: For parallel execution of code.
- **Async/Await**: For non-blocking I/O operations.

## Threads

Threads allow you to run multiple pieces of code at the same time. Rust's standard library provides an API for creating and managing threads.

You can create a new thread by calling the `thread::spawn` function. It takes a closure as an argument, which contains the code that will be executed in the new thread.

### Most common functions

- `thread::spawn(f)`: Creates a new thread and runs the closure `f` in it.
- `thread::sleep(duration)`: Pauses the current thread for the specified duration.
- `handle.join()`: Waits for the associated thread to finish.

### Example with a shared mutable value

To share a mutable value between threads, you need to use `Arc` and `Mutex`.

- `Arc`: Atomically Reference Counted pointer. It allows multiple threads to own the data.
- `Mutex`: Mutual Exclusion. It ensures that only one thread can access the data at a time.

```rust
use std::sync::{Arc, Mutex};
use std::thread;

fn main() {
    let counter = Arc::new(Mutex::new(0));
    let mut handles = vec![];

    for _ in 0..10 {
        let counter = Arc::clone(&counter);
        let handle = thread::spawn(move || {
            let mut num = counter.lock().unwrap();
            *num += 1;
        });
        handles.push(handle);
    }

    for handle in handles {
        handle.join().unwrap();
    }

    println!("Result: {}", *counter.lock().unwrap());
}
```

This example creates 10 threads, and each thread increments a shared counter. The `Mutex` ensures that the increments are atomic and there are no data races.
