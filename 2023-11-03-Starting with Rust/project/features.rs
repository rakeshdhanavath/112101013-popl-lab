fn main()
{

    /* This is a short program demonstrating some of the features of
     ** rust type system. There are some commented, syntactically valid
     ** lines that you can uncomment. These will lead to errors but those
     ** errors illustrate what has gone wrong.
     **
     **/


    /************** Mutability  ****************************************/
    let x = 10;       /* x is not mutable and hence you cannot change
                         its value.
                       */
    let mut y  = 100;  /* y is mutable can hence can change its value */
    println!("x = {0} and y = {1}",x,y);

    y = x;

    // x = 42; // Uncomment and get an error

    println!("x = {0} and y = {1}",x,y);

    /************** End demo on Mutability ******************************/

    /*************** Ownership ******************************************/

    let xbox : Box<u32> = Box::new(10);  // xbox was the owner of the value

    // let var : type = value
    let x1box : Box<u32> = Box::new(42);

    println!("xbox = {0}", xbox);

    // let mut ybox  = xbox; /* Ownership has transfered from xbox to ybox */

    // xbox = foo(xbox)   fn foo(u : Box<u32>)... return u.

   let ybox = x1box;
    let zbox = xbox; // Uncomment to get an error


    // println!("xbox = {0}", xbox); // Uncomment and get an error

    println!("ybox = {0}", ybox);

    {

        // zbox is a reference to a value of type Box<u32>
        // zbox has borrowed from ybox but ownership is with ybox
    let zbox : &Box<u32>= &ybox; /* zbox borrows the resource form y */
    let vbox : &Box<u32>= &ybox;
    println!("ybox = {0} and zbox = {1}", ybox, zbox);

    }
    let mut something : Box<u32> = Box::new(50);
    answer(&mut something);
    println!("something = {}",something);


    let xboxp = foo (ybox);
    println!("xboxp = {}",xboxp);


}

fn foo (x : Box <u32>) -> Box <u32>
{
    println!("In foo x = {}", x);
    return x;
}

fn this() -> Box<u32>
{
    let xbox = Box::new(10);
    return xbox
}
fn answer(x :  &mut Box<u32>)
{
    **x = 42
}

