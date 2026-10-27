% Clave secreta:

clave_secreta([D1, D2, D3, D4, D5]):-
    asignar_digito(D5),
    asignar_digito(D3),
    =:=(+(D5, D3), 14),
    asignar_digito(D2),
    asignar_digito(D4),
    succ(D2, D4), %=:=(D4, +(D2, 1)),
    asignar_digito(D1),
    succ(*(D2, 2), D1),%=:=(D1, -(*(D2, 2), 1)),
    =:=(+(D2, D3), 10),
    =:=(D1 + D2 + D3 + D4 + D5, 30).

asignar_digito(0).
asignar_digito(1).
asignar_digito(2).
asignar_digito(3).
asignar_digito(4).
asignar_digito(5).
asignar_digito(6).
asignar_digito(7).
asignar_digito(8).
asignar_digito(9).


% Tres senoras - sin lista:

tres_senoras_sin(Blanco, Rubio, Castano):-
    color_cabello(Blanco),
    \==(Blanco, blanco),
    \==(Blanco, castano),
    color_cabello(Rubio),
    \==(Rubio, rubio),
    \==(Rubio, Blanco),
    color_cabello(Castano),
    \==(Castano, castano),
    \==(Castano, Blanco),
    \==(Castano, Rubio).


% Tres senoras - con lista:

tres_senoras(L):-
    =(L, [Blanco, Rubio, Castano]),
    color_cabello(Blanco),
    \==(Blanco, blanco),
    \==(Blanco, castano),
    color_cabello(Rubio),
    \==(Rubio, rubio),
    \==(Rubio, Blanco),
    color_cabello(Castano),
    \==(Castano, castano),
    \==(Castano, Blanco),
    \==(Castano, Rubio).

color_cabello(blanco).
color_cabello(rubio).
color_cabello(castano).


% Hilera de cuatro casas:

hilera_de_casas(L):-
    =(L, [[1, _], [2, _], [3, _], [4, _]]),
    asignar_casa([V, vasquez], L),
    asignar_casa([M, moreno], L),
    (
        succ(V, M)
        ;
        succ(M, V)
    ),
    asignar_casa([G, gonzalez], L),
    (
        not(succ(V, G))
        ,
        not(succ(G, V))
    ),
    asignar_casa([F, flores], L),
    (
        not(succ(F, G))
        ,
        not(succ(G, F))
    ).

asignar_casa([1, X], [[1, X], _, _, _]).
asignar_casa([2, X], [_, [2, X], _, _]).
asignar_casa([3, X], [_, _, [3, X], _]).
asignar_casa([4, X], [_, _, _, [4, X]]).


% Edificio de cinco pisos:

cinco_plantas(L):-
    =(L, [[1, _], [2, _], [3, _], [4, _], [5, _]]),
    asignar_piso([Chilo, chilo], L),
    =\=(Chilo, 5),
    asignar_piso([Canuta, canuta], L),
    =\=(Canuta, 1),
    asignar_piso([Mario, mario], L),
    =\=(Mario, 5),
    =\=(Mario, 1),
    asignar_piso([Marina, marina], L),
    (
        not(succ(Mario, Marina))
        ,
        not(succ(Marina, Mario))
    ),
    (
        not(succ(Mario, Canuta))
        ,
        not(succ(Canuta, Mario))
    ),
    asignar_piso([Lencha, lencha], L),
    >(Lencha, Canuta).

asignar_piso([1, X], [[1, X], _, _, _, _]).
asignar_piso([2, X], [_, [2, X], _, _, _]).
asignar_piso([3, X], [_, _, [3, X], _, _]).
asignar_piso([4, X], [_, _, _, [4, X], _]).
asignar_piso([5, X], [_, _, _, _, [5, X]]).


% Sala de cine:

sala_de_cine(L):-
    =(L, [[1, _], [2, _], [3, _], [4, borracho], [5, _], [6, _], [7, _], [8, _]]),
    is(Bo, 4),
    asignar_butaca([Ro, rosita], L),
    asignar_butaca([Ra, ramon], L),
    (
        succ(Ro, Ra)
        ;
        suc(Ra, Ro)
    ),
    (
        not(succ(Ro, Bo)
        ,
        not(suc(Bo, Ro))
    ),
    (
        not(succ(Ra, Bo)
        ,
        not(suc(Bo, Ra))
    ),
    asignar_butaca([To, tona], L),
    asignar_butaca([Ju, juanito], L),
    (
        succ(To, Ju)
        ;
        succ(Ju, To)
    ),
    asignar_butaca([An, anita], L),
    (
        succ(To, An)
        ;
        succ(An, To)
    ),
    asignar_butaca([Ma, mario], L).

asignar_butaca([1, X], [[1, X], _, _, _, _, _, _, _]).
asignar_butaca([2, X], [_, [2, X], _, _, _, _, _, _]).
asignar_butaca([3, X], [_, _, [3, X], _, _, _, _, _]).
asignar_butaca([4, X], [_, _, _, [4, X], _, _, _, _]).
asignar_butaca([5, X], [_, _, _, _, [5, X], _, _, _]).
asignar_butaca([6, X], [_, _, _, _, _, [6, X], _, _]).
asignar_butaca([7, X], [_, _, _, _, _, _, [7, X], _]).
asignar_butaca([8, X], [_, _, _, _, _, _, _, [8, X]]).

