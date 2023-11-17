structure StopWatch = struct
open CML
type clock = { hour : int, minute : int, secs : int }
val lineKill   = "\b\b\b\b\b\b\b\b\b"

fun program () =
    let val mv : clock MVar.mvar = MVar.make ()
	fun update cstate = 
	    let val h = #hour cstate
		val m = #minute cstate
		val s = #secs cstate
		val sp = (s+1)
		val mp = if sp = 60 then (m + 1)
			 else m
		val hp = if mp = 60 then h + 1
			 else h
	    in
                MVar.put mv cstate;
		sync (timeOutEvt (Time.fromSeconds 1)) ;
		update {hour = hp, minute = mp mod 60, secs = sp mod 60}
	    end

	fun show () : unit =
	    let val tm = MVar.take mv
		val h = #hour tm
		val m = #minute tm
		val s = #secs tm
	    in TextIO.print ( lineKill ^
		              Int.toString h ^ ":" ^
			      Int.toString m ^ ":" ^
			      Int.toString s
			    );
	       show ()
	    end	
    in spawn (fn () => update {hour=0,minute =0,secs = 0});
       show ()
    end
fun main (name, args) = RunCML.doit (program, NONE)
end

val _ = StopWatch.main ("foo", [])
