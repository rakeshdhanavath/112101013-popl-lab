signature COUNTER =
sig
   val incr : unit -> unit
   val decr : unit -> unit
   val get  : unit -> int
end

structure Counter :> COUNTER =
struct
   val num = ref 0
   fun incr () = (num := !num + 1)
   fun decr () = (num := !num - 1)
   fun get  () = !num
end
functor MkCounter () :> COUNTER =
struct
   val num = ref 0
   fun incr () = (num := !num + 1)
   fun decr () = (num := !num - 1)
   fun get  () = !num
end

