fn main() {
    println!("Hello, World!");

    let s1 = String::from("Hello");
    let s2 = s1;  // Move ownership from s1 to s2

    // The following line would cause an error because s1 is no longer valid.
    // println!("s1: {}", s1);

    println!("s2: {}", s2); // This is fine, as s2 now owns the string.

#[derive(Clone, Copy)]
struct MyType {
    value: i32,
}

    let a = MyType { value: 42 };
    let b = a; // Copy is performed, a is still usable

    println!("a: {}", a.value); // This is still valid
    println!("b: {}", b.value); // b has the copied value

    let c = a.clone(); // Cloning is performed, creating a new value
    println!("c: {}", c.value);
   
struct MyResource {
    name: String,
}

impl MyResource {
    fn new(name: &str) -> MyResource {
        MyResource { name: name.to_string() }
    }
}

impl Drop for MyResource {
    fn drop(&mut self) {
        println!("Dropping MyResource: {}", self.name);
    }
}


    let _resource = MyResource::new("Example");
    // resource is dropped at the end of this scope
    println!("End of main");
}
