%Entrada: buscar([ [ [ [ ],1,[ ] ],3,[[ ],4,[ ] ] ],5, [ [ ],9, [ [ ], 11,[ ] ] ] ],11).
%recorrido en preorden
preorden([]):- !.

preorden([SAI, Dato, SAD]):-
    writeln(Dato),
    preorden(SAI),
    preorden(SAD).

%recorrido en Inorden
inorden([]):- !.

inorden([SAI, Dato, SAD]):-
    inorden(SAI),
    writeln(Dato),
    inorden(SAD).

%recorrido en postorden
postorden([]):- !.

postorden([SAI, Dato, SAD]):-
    postorden(SAI),
    postorden(SAD),
    writeln(Dato).
    
%Busqueda en ABB:

buscar([_, N, _], N):-
    writeln("Dato encontrado"),
    !.

buscar([ ], _):-
    writeln("Dato no encontrado"),
    !.

/*buscar([SAI, Dato, SAD], N):-
    (
        <(N, Dato),
        buscar(SAI, N)
        ;
        >(N, Dato),
        buscar(SAD, N)
    ).
*/

buscar([SAI, Dato, SAD], N):-
    (<(N, Dato)->
        buscar(SAI, N)
        ;
        buscar(SAD, N)
    ).

/*buscar([SAI, Dato, _], N):-
    <(N, Dato),
    buscar(SAI, N).

buscar([_, Dato, SAD], N):-
    >(N, Dato),
    buscar(SAD, N).
*/

%Altura de un arbol

altura([ ],0):- !.

altura([SAI,_,SAD], H):-
    altura(SAI,HI),
    altura(SAD,HD),
    is(H, +(1, max(HI, HD))).
    
