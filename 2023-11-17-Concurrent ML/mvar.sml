structure MVar = struct
  open CML
  type 'a mvar = { rChan : 'a chan, sChan : 'a chan }

  fun make () : 'a mvar = let val rc = channel()
                              val sc = channel()
                              fun serve () : unit = let val x = recv sc
                                                        val _ = send (rc,x)
                                                    in 
                                                        serve()
                                                    end
                          in
                              spawn (fn () => serve ());
                              {rChan = rc, sChan = sc }
                          end
  fun take (mv: 'a mvar) : 'a        = recv (#rChan mv)
  fun put (mv:'a mvar) (x:'a) :unit  = send (#sChan mv, x)
end
