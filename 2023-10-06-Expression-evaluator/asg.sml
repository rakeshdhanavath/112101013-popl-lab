(*--- Q`1---*)
datatype Expr = Const       of real
              | Variable    of string
              | Plus        of Expr * Expr
              | Mul         of Expr * Expr

datatype Stmt = Assignment of (string * Expr) | Print of Expr

type Program = Stmt list
(*--------Q-2 -----*)
type Env = real AtomMap.map

fun eval (e: Env) (exp: Expr): real option =
  case exp of
    Const value         => SOME value
  | Variable x          => AtomMap.find (e, Atom.atom x)
  | Plus (exp1, exp2)   =>
      (case (eval e exp1, eval e exp2) of
         (SOME val1, SOME val2) => SOME (val1 + val2)
       | _                      => NONE)
  | Mul (exp1, exp2)    =>
      (case (eval e exp1, eval e exp2) of
         (SOME val1, SOME val2) => SOME (val1 * val2)
       | _ => NONE)


fun execute  (e: Env) (s : Stmt) : Env = 
  case s of
    Print exp => 
        (case (eval e exp) of
              SOME num  => (
                print ((Real.toString num)^"\n");
                e
              )
            | NONE      => (
              print "error evaluating (No variable)\n";
              e
            ))
  | Assignment (var, exp) =>
      let
        val at = Atom.atom var;
      in
        (case (eval e exp) of
              SOME num => AtomMap.insert(e, at, num)
            | NONE     => e)
      end

val map: Env ref = ref AtomMap.empty

fun ucExecute (s: Stmt , e: Env) = execute e s 

fun interpret (pgm : Program): unit = map := List.foldl ucExecute (!map) pgm
