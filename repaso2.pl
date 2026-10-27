contar([], 0):- !.
contar([H|T], N):-
    contar(T, N1),
    N is N1 + 1.

sumar([], 0):- !.
sumar([H|T], Sum):-
    sumar(T, Sum1),
    Sum is Sum1 + H.

primeros([], []):- !.
primeros([Sublista|Resto], [Primero| T]):-
    Sublista = [Primero | _],
    primeros(Resto, T).

primeros([[]|Resto], T):-
    primeros(Resto, T).

repetir(0, _, []):- !.
repetir(N, Elem, [H|T]):-
    H = Elem,
    N1 is N-1,
    repetir(N1, Elem, T).

repetirSublist([], []):- !.
repetirSublist([[N, Elem]|Resto], [Sublista|T]):-
    repetir(N, Elem, Sublista),
    repetirSublist(Resto, T).

filtrarPorSuma([], []):- !.
filtrarPorSuma([Sublista|])