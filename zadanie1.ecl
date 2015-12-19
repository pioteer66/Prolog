czy_posortowane([_], 'T').			/*jeden element - prawda*/
czy_posortowane([H|[H1|T]], ODP):- H1>H, czy_posortowane([H1|T], ODP),!;ODP='N'.
/*wykrzyknik - jeśli napotkano na prawdę, to nie są sprawdzane dalsze warunki */