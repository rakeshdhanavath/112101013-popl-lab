fun c f x y z = f (x,y,z);
fun uc f (x,y,z) = f x y z;
fun f (x,_) = x;
fun s (_,y) = y;
fun len  [] = 0
  | len (x::xs) = 1 + length xs;
fun rev l =
let
  fun aux [] acc = acc
    | aux (x::xs) acc = aux xs (x::acc)
in
  aux l []
end;
fun fib n = if n <= 1 then n
            else fib(n-1) +fib(n-2);

