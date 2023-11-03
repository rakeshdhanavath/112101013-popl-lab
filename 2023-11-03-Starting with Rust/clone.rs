/**

# Copy or Move.

1. By default every type has the move semantics. To make a given type
   have copy semantics it should have the trait Copy.

2. The Clone is a super trait of Copy (Everything that has Copy has to have Clone).
   So to get Copy semantics for your type you need both Clone and Copy as demonstrated
   below.

*/


/// This will have copy semantics
pub struct A {
    pub val : u32
}

/// This will have move semantics.
pub struct B {
    pub val : u32
}


/// See <https://doc.rust-lang.org/std/clone/trait.Clone.html>
impl Clone for A {
    fn clone(&self) -> A { *self }

}

/// See <https://doc.rust-lang.org/std/marker/trait.Copy.html>
impl Copy for A {}

fn main()
{

    let xa : A = A { val : 42 };
    let xb : B = B { val : 42 };

    let ya = xa;
    let yb = xb;

    println!("ya = A({0}), xa = A({1})", ya.val , xa.val);


    println!("yb = B({0})", yb.val);

    // println!("xb = B({})", x_b.val) // error move semantics for B

}

