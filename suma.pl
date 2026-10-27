sumarElementos(Lista, Suma):-
    sumarE_rec(Lista, Suma).
 
sumarE_rec([ ], 0):- !.
 
sumarE_rec([Cab|Col], Suma):-
    sumarE_rec(Col, SumaAnt),
    is(Suma, +(SumaAnt, Cab)).