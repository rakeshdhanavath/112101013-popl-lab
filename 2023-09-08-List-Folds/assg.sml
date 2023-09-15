fun foldr f a [] = a
  | foldr f a (b::bs) = f (b,(foldr f a bs))
fun foldl f a [] = a
  | foldl f a (b::bs) = foldl f (f (a,b)) bs
fun add (a,b) = a + b;
fun sum cs = foldl add 0 cs
fun partition f cs = let
                        fun seperate (c,(pos,neg)) = if f c then
                                                     (c::pos,neg)
                                                   else
                                                     (pos,c::neg)
                     in
                        foldr seperate ([],[]) cs
                     end
fun map f cs = foldr (fn (a,b) => f(a)::b) [] cs
fun reverse cs = foldl (fn (a,b) => b::a) [] cs

datatype 'a Find = LookingFor of int
                 | Found      of 'a

datatype 'a option = SOME of 'a | NONE;



fun nthAux (x, y) = let
                        fun helper (Found v ,u)      = Found v
                          | helper (LookingFor v ,u) = if v = 0 then
                                                         Found u
                                                     else
                                                         LookingFor (v - 1)
                    in
                        foldl helper (LookingFor y) x
                    end

fun nth (x, y) = case (nthAux (x, y)) of
                     LookingFor _ => NONE
                   | Found v      => SOME v

