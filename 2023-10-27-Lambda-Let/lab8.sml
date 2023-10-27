datatype expr = V of Atom.atom
              | App of expr      * expr
              | Abs of Atom.atom * expr

fun var(x: string)     = V (Atom.atom x)
fun app e1 e2          = App (e1,e2)
fun abs (x:string) e   = Abs (Atom.atom x, e)

datatype Llet = Vlet    of Atom.atom
              | AppLet  of Llet      * Llet
              | AbsLet  of Atom.atom * Llet
              | Let     of Atom.atom * Llet * Llet


datatype LrecLet = VrecLet    of Atom.atom
                 | ApprecLet  of LrecLet    * LrecLet
                 | AbsrecLet  of Atom.atom  * LrecLet
                 | RecLet     of Atom.atom  * LrecLet * LrecLet

fun LetToCalc (Vlet x)          = V x
  | LetToCalc (AppLet (l1, l2)) = App (LetToCalc l1, LetToCalc l2)
  | LetToCalc (AbsLet (x, l))   = Abs (x, LetToCalc l)
  | LetToCalc (Let (x, l1, l2)) = App (Abs(x, LetToCalc l2),LetToCalc l1)
