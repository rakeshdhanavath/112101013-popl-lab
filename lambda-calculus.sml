datatype expr = Var of Atom.atom
       |App of expr*expr
       |Abs of Atonm.atom*expr

fun pretty(e:expr):string=
   case e of
        Var x=> Atom.toString x
      |APP(e1,e2) =>"("^preety e1^""prety e2^")"
      |Abs(x,e1)=>"(\\"^Atom.toString x^"."^preety e1^")"
(* 3 - question *)
fun freee:expr():AtomSet.set =
    case e of
         Var x=> AtomSet.singleton x
       |App(e1,e2)=> AtomSet.union(free e1,free e2)
       |Abs (x,e1)=> AtomSet.subtract(free e1,x)

fun bound(e:expr): AtomSet.set=
   case e of
        Var_=> AtomSet.empty
       |App(e1,e2)=>AtomSet.union(bound e1,bound e2)
       |Abs(x,e1)=> AtomSet.add(bound e1,x) 

      
fun subste:expr((x,e2):Atom.atom*expr):expr=
  case e of
       Var y => if Atom.same(x,y)then e2 else e
     |App(e1,e2)=>App(subsete1(x,e),subsete2(x,e2))
     |Abs(y,e1)=> if Atom.same(x,y)thenm e else
       Abs(y,subset e1(x,e2))

(*Question-5*)

(*diahg:string->string*)
fun diag xy = string.isPrefix xy theny^"n"elsex^"n"
 
(*diagA:string->atom->string*)
fun diagA xy = diag x (Atom.toStringy)

(*fresh:atom set->atom*)
fun fresh names=Atom.atom(AtomSet.foldl(fn(x,y)=>(fn z=>zyx)diagA)""names)
