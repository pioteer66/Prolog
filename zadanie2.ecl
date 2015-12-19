bubble_sort(L_wejsciowe, L_wyjsciowe) :- 
			bubble(L_wejsciowe, L_tmp)->
			bubble_sort(L_tmp, L_wyjsciowe);
			L_wejsciowe = L_wyjsciowe.
		
bubble([A,B|T], L2) :- 
			A < B ->
			L2 = [B,A|T];
			L2=[A|L_tmp2],
			bubble([B|T],L_tmp2).
		
czy_lista_zer([0]).			/*jeden element - prawda*/
czy_lista_zer([H|T]):- H = 0,
			czy_lista_zer(T), !.

ciag_graficzny(L) :-
			bubble_sort(L, Sorted),
			(czy_lista_zer(Sorted),!;
			(pomniejsz_o_jeden(Sorted, Sorted2),
			ciag_graficzny(Sorted2))),!.
			
minus_jeden(0,L, L2) :- L2 =L.		
minus_jeden(N, [A|T], [B|T2]) :- 
			N>0,
			P is N-1,
			minus_jeden(P,T, T2),
			B is A-1.
pomniejsz_o_jeden([A|T], L2) :- 
			minus_jeden(A, T, L2).
			
	
			
