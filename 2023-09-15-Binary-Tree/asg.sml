(* question - 1 *)
 

  datatype 'a tree = Leaf
                        | Node of 'a * 'a tree * 'a tree


(* question - 2 *)

 fun mapT f Leaf = Leaf
  | mapT f (Node (x, left, right)) = Node (f x, mapT f left, mapT f right)

(* question - 3 *)



fun inOrder Leaf = []
  | inOrder (Node (x, left, right)) = inOrder left @ [x] @ inOrder right

fun preOrder Leaf = []
  | preOrder (Node (x, left, right)) = [x] @ preOrder left @ preOrder right

fun postOrder Leaf = []
  | postOrder (Node (x, left, right)) = postOrder left @ postOrder right @ [x]

(* question - 4 *)
fun treeFoldr f acc Leaf = acc
  | treeFoldr f acc (Node (x, left, right)) = f x (treeFoldr f acc right) (treeFoldr f acc left)


(* question - 5 *)
fun treeFold f acc Leaf = acc
  | treeFold f acc (Node (x, left, right)) = f x (treeFold f acc left) (treeFold f acc right)

fun inOrder t = treeFold (fn x => fn l => fn r => l @ [x] @ r) [] t

fun preOrder t = treeFold (fn x => fn l => fn r => [x] @ l @ r) [] t

fun postOrder t = treeFold (fn x => fn l => fn r => l @ r @ [x]) [] t      
(* question - 6 *)

fun rotateClockwise Leaf = Leaf
  | rotateClockwise (Node (a, Leaf, right)) = Node (a, Leaf, right)
  | rotateClockwise (Node (a, Node (b, leftB, rightB), right)) =
      Node (b, leftB, rotateClockwise (Node (a, rightB, right)))

