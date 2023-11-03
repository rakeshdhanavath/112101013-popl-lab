pub struct A  {
    pub name : u32
}

impl Drop for A
{
    fn drop (&mut self)
    {
	println!("{0} dies", self.name)

    }
}

fn main ()
{
    let x = A { name : 10 };

    {
	let y = x;
	println!("\ty is {0}", y.name);
    }

    println!("out of brace")
}

