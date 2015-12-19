mozliwosc_ruchu(A, B, C) :- (A>1;B>1; C>1).
mozliwosc_ruchu(A, B, C) :- (A>0, B>0;A>0,C>0).

czy_wygrywa(A,B,C, Gracz) :- (
					Gracz=1,(
						mozliwosc_ruchu(A,B,C), 
						(
							(B>1, czy_wygrywa(A, B-2, C, 2));
							(C>1, czy_wygrywa(A, B, C-2, 2));
							(A>0, B>0, czy_wygrywa(A-1, B-1, C, 2));
							(A>0, C>0, czy_wygrywa(A-1, B, C-1, 2));
							(A>1, czy_wygrywa(A-2, B, C, 2))
						)
					);
					(Gracz = 2,
						(
							B>1 -> czy_wygrywa(A, B-2, C, 1); true,
							C>1 -> czy_wygrywa(A, B, C-2, 1); true,
							(A>0, B>0)->czy_wygrywa(A-1, B-1, C, 1); true,
							(A>0, C>0)-> czy_wygrywa(A-1, B, C-1, 1); true,
							A>1-> czy_wygrywa(A-2, B, C, 1); true
						)
					)
					).
		czy_w(A,B,C) :- czy_wygrywa(A,B,C,1) ->false; true.
