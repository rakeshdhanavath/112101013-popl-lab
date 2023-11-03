(* Question-1 *)

datatype expr        = Var of Atom.atom
                     | App of expr*expr
                     | Abs of Atom.atom*expr

datatype bruijn_expr = Var_D of int
                     | App_D of bruijn_expr*bruijn_expr
                     | Abs_D of bruijn_expr

(* Question-2 *)

(*  diagonalize : string -> string -> string *)
fun diagonalize x y = if (String.isPrefix x y) then (y ^ "z") else (x ^ "z")

(* diaA : string -> atom -> string *)
fun diaA a x = diagonalize (Atom.toString x) a

(* fresh : AtomSet -> atom *)
fun fresh atomset = 
        let 
          fun sumf (x, a) = diaA a x
        in
          Atom.atom( AtomSet.foldl sumf "" atomset )
        end

(* helper : string list -> AtomSet -> bruijn_expr -> expr *)
fun helper list set (Var_D index)        = let val nth = List.nth (list, index - 1)
                                             in
                                              Var (Atom.atom nth)
                                             end
  | helper list set (App_D (exp1, exp2)) = App (helper list set exp1, helper list set exp2)
  | helper list set (Abs_D exp)          = let val nList = Atom.toString(fresh set) :: list
                                               val nSet  = AtomSet.add(set, fresh set)
                                             in
                                              Abs (fresh set, helper nList nSet exp)
                                             end

(* bruijn_expr_to_lambda = bruijn_expr -> expr *)
fun bruijn_expr_to_lambda bruijn_expr = helper [] AtomSet.empty bruijn_expr
