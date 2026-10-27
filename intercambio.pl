intercalar(A, B, C):-
    length(A, La),
    length(B, Lb),  
    =:=(La, Lb),
    intercalar_rec(A, B, C).
 
intercalar_rec([ ], [ ], [ ]):- !.
 
intercalar_rec([CabA|ColA], [CabB|ColB], [CabA,CabB|Ctemp]):-
    intercalar_rec(ColA, ColB, Ctemp).