---
tags:
  - coding
  - rust
  - datatypes
  - smart pointers
---

# Smart Pointers

![](docs/rust-memory-container-cs.png){.center width="100.0%"}

Smart Pointers are datastructure that act like a pointer but have added functionalities added on. Smart Pointers own the data which they point to.

Strings and Vectors are Smart Pointers. All Smart Pointers implement the two [traits](traits.md):

- `deref` - Allows instances of Smart Pointer struct accessed as references
- `drop` - used if an instance of a Smart Pointer gets out of scope

Many libraries implement their own Smart Pointers. In the standard library there are three important ones:

- `Box<T>` - for allocating values on the heap
- `Rc<T>` - for reference counting enabling multiple ownership
- `Ref<T>` amd `RefMut<T>`, accessed through `RefCell<T>` - a type that enforces the borrowing rules at runtime instead of compile time.

## `Box`

On the stack a pointer is stored and pointing to some arbitary sized data on the heap. Box don't have many overhead.

To be used for:

- Type were the exact type size can't be know at compile time
- Large amount of data and transfering the owernership without copying it.
- Own a value and want to implement a specific trait (this is a trait object)

```rust
fn main () {
  let b = Box::new(5);
  println!("b = {}", b)
} // Box b goes here out of scope and will be deallocated
```

## Example

recursive enum

```rust
// recursive enum
enum List {
  Cons(i32, Box<List>),
  Nil,
}

use List::{Cons, Nil}

fn main() {
  let list = Cons(1, Box::new(Cons(2, Box::new(Cons(3, Box::new(Nil))))));
}
```

## Reference Counting `Rc`

For single value which has multiple owners. Keeps track the number of references to a value. Once zero the variable will get cleaned up. This example works only for single threaded programs:

```rust
use std::rc:Rc;

enum List {
  Cons(i32, Rc<List>),
  Nil,
}

use crate::List::{Cons, Nil};

fn main() {
  lat a = Rc::new(Cons(5, Rc::new(Cons(10, Rc::new(Nil)))));
  println!("count after creating a = {}", Rc::strong_count(&a));
  // two variants of cloning resp. increasing the reference counter
  lat b = Cons(3, Rc::clone(&a)); // add to refrerence counter
  println!("count after creating b = {}", Rc::strong_count(&a));
  {
    lat c = Cons(4, a.clone());     // add to reference counter
    println!("count after creating c = {}", Rc::strong_count(&a));
  }
  println!("count after c goes out of scope = {}", Rc::strong_count(&a));
}
```

```text
count after creating a = 1
count after creating b = 2
count after creating c = 3
count after c goes out of scope = 2
```

## `Arc`

`Arc` stands for **Atomically Reference Counted**. It is a smart pointer that provides shared ownership of a value of type `T`, allocated on the heap. The "atomically" part means it is thread-safe. When the last `Arc` pointer to a value is destroyed, the value is also dropped. `Arc<T>` is very similar to `Rc<T>`, but it uses atomic operations for its reference counting, which makes it safe to share between threads. This also means it has a small performance overhead compared to `Rc<T>`.

You use `Arc<T>` when you need to share data between multiple threads, and you want to avoid the overhead of copying the data.

An `Arc` can be combined with a `Mutex` or `RwLock` to allow for safe mutation of the shared data across multiple threads. The `Arc` provides shared ownership, and the `Mutex`/`RwLock` provides safe interior mutability.

### Example

Here is an example of using `Arc` to share data between multiple threads:

```rust
use std::sync::Arc;
use std::thread;

fn main() {
    let data = Arc::new(vec![1, 2, 3, 4, 5]);

    let mut handles = vec![];

    for i in 0..5 {
        // Clone the Arc for each thread
        let data_clone = Arc::clone(&data);
        let handle = thread::spawn(move || {
            // Each thread has read-only access to the shared data
            println!("Thread {}: data at index {}: {}", i, i, data_clone[i]);
        });
        handles.push(handle);
    }

    // Wait for all threads to finish
    for handle in handles {
        handle.join().unwrap();
    }

    println!("All threads finished.");
    // The strong_count will be 1 here, as all clones have been dropped
    println!("Original data reference count: {}", Arc::strong_count(&data));
}
```

### Common Functions

- `Arc::new(data: T) -> Arc<T>`: Creates a new `Arc` with the given data. This allocates the data on the heap and sets the strong reference count to 1.
- `Arc::clone(arc: &Arc<T>) -> Arc<T>`: Creates a new `Arc` that points to the same allocation as the original `arc`. This increases the strong reference count by one. This is the preferred way to create new references.
- `Arc::strong_count(arc: &Arc<T>) -> usize`: Returns the number of strong references to the `Arc`. This is the number of `Arc` pointers that share ownership of the data. When this count reaches zero, the data is dropped.
- `Arc::weak_count(arc: &Arc<T>) -> usize`: Returns the number of weak references to the `Arc`.
- `Arc::downgrade(arc: &Arc<T>) -> Weak<T>`: Creates a `Weak` pointer from an `Arc`. A `Weak` pointer allows you to observe the data without owning it. It does not prevent the data from being dropped. This is useful for breaking reference cycles.
- `Weak::upgrade(weak: &Weak<T>) -> Option<Arc<T>>`: Attempts to upgrade a `Weak` pointer to an `Arc`. If the data has not been dropped (i.e., the strong count is still greater than zero), it returns `Some(Arc<T>)`. Otherwise, it returns `None`.

## `CoW` Smart Pointer

`Cow` is a **Clone-on-Write** smart pointer. It is an enum that can hold either a borrowed reference or an owned value. A `Cow` can be created from a borrowed reference. As long as you only perform immutable operations, it will continue to borrow. If you need to mutate the data or take ownership, `Cow` will clone the data and give you an owned version. This is useful for functions that can accept either borrowed or owned data, and only clone when necessary.

This is particularly useful for functions that want to accept a `&str` or a `String`, but only want to allocate a new `String` if the input needs to be modified.

### Example

```rust
use std::borrow::Cow;

fn abs_all(input: &mut Cow<[i32]>) {
    for i in 0..input.len() {
        if input[i] < 0 {
            // Clones into a vector if not already owned.
            input.to_mut()[i] = -input[i];
        }
    }
}

fn main() {
    // No clone occurs because the data is already owned.
    let mut slice = vec![-1, 0, 1];
    let mut input = Cow::from(&mut slice);
    abs_all(&mut input);
    println!("Owned: {:?}", input);


    // A clone occurs because the data is borrowed.
    let slice = &[-1, 0, 1][..];
    let mut input = Cow::from(slice);
    abs_all(&mut input);
    println!("Borrowed: {:?}", input);
}
```

### Common Scenarios

- **API Design:** When you design a function that can accept either a borrowed slice (`&[T]`) or an owned `Vec<T>`, or a `&str` or a `String`. The function can then modify the data if needed, and the caller doesn't have to worry about providing an owned value upfront if it's not necessary.
- **Performance Optimization:** Avoid unnecessary cloning. If the data doesn't need to be changed, no allocation or cloning occurs.

### Variants

`Cow` is an enum with two variants:

- `Borrowed(B)`: Contains a borrowed reference.
- `Owned(O)`: Contains an owned value.

Where `B` is the borrowed type (e.g., `&'a str`, `&'a [T]`) and `O` is the owned type (e.g., `String`, `Vec<T>`).

### Common Functions

- `Cow::from(borrowed: B) -> Cow<'a, T>`: Creates a `Cow` from a borrowed reference.
- `Cow::from(owned: O) -> Cow<'a, T>`: Creates a `Cow` from an owned value.
- `to_mut(&mut self) -> &mut O`: Returns a mutable reference to the owned version of the data. If the data is borrowed, it will be cloned to create an owned version first.
- `into_owned(self) -> O`: Clones the data if it is borrowed and returns ownership of the clone. If it is already owned, it is returned without a clone.

## `RefCell` Smart Pointer

Allows checking of the borrowing rules at runtime. Only possible to used in single threaded application. It allows multiple onwership to a data structure.

It is important to note that using a RefCell can introduce a race condition if the vector is modified by another thread while you are trying to modify it. To avoid this, you should only use a RefCell in a safe context, such as a single-threaded application or a thread-safe function.

```rust
use std::cell::RefCell;

fn main() {
  let mut strings = vec![String::from("Hello"), String::from("World")];

  let ref_cell = RefCell::new(&mut strings);

  *ref_cell.borrow_mut()[0] = String::from("Goodbye");

  println!("{:?}", strings);
}
```
