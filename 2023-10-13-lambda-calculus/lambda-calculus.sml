
datatype expr = Var of Atom.atom
       |App of expr * expr
       |Abs of Atom.atom * expr

fun pretty(e:expr):string=
   case e of
        Var x=> Atom.toString x
      |App(e1,e2) =>"("^pretty e1^""^pretty e2^")"
      |Abs(x,e1)=>"(\\"^Atom.toString x^"."^pretty e1^")"
							  

(* 3 - question *)
fun free(e:expr):AtomSet.set =
    case e of
         Var x => AtomSet.singleton x
       |App(e1,e2) => AtomSet.union(free e1,free e2)
       |Abs (x,e1) => AtomSet.subtract(free e1,x)

fun bound(e:expr): AtomSet.set=
   case e of
        Var_=> AtomSet.empty
       |App(e1,e2) => AtomSet.union(bound e1,bound e2)
       |Abs (x,e1) => AtomSet.add(bound e1,x)


fun subst (e:expr) ( (x,e2) : Atom.atom * expr ) : expr=
  case e of
       Var y => if Atom.same(x,y)then e2 else e
     |App(e1,e2) => App(subst e1(x,e2),subst e2(x,e2))
     |Abs(y,e1) => if Atom.same(x,y)then  e else
          Abs(y,subst e1(x,e2))
          


(*Question-5*)

(*diag :string-> string ->string*)
fun diag x y =if String.isPrefix x y then y^"n"
             else x^"n"

(*diagA:string->atom->string*)
fun diagA x y = diag x (Atom.toString y)

(*fresh:atom set->atom*)
fun fresh names = Atom.atom (AtomSet.foldl(fn (x , y) => (fn z=> z y x) diagA ) ""names )

	  
