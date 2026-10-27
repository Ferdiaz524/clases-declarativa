buscarABB(_, []):-
    writeln("Dato no encontrado"),
    !.

buscarABB(Dato, [_, Dato, _]):-
    writeln("Dato: "),
    writeln(Dato),
    writeln(" Dato encontrado"),
    !.

buscarABB(Dato, [SAI, DatoN, _]):-
    <(Dato, DatoN),
    buscarABB(Dato, SAI),
    !.

buscarABB(_, DatoN, SAD):-
    >(Dato,DatoN),
    buscarABB(Dato, SAD).

preorden([]):- !.

preorden([SAI, DATO, SAD]):-
    writeln(DATO),
    preorden(SAI),
    preorden(SAD).

inorden([]):- !.

inorden([SAI, DATO, SAD]):-
    inorden(SAI),
    writeln(DATO),
    inorden(SAD).

postorden([]):- !.

postorden([SAI, dato, SAD]):-
    postorden(SAI),
    postorden(SAD),
    writeln(dato).

altura([], 0):- !.

altura([SAI, _, SAD], H):-
    altura(SAI, H1),
    altura(SAD, H2),
    H is 1 + max(H1, H2).

d(Var, cot(Var), -1/(sen(Var))^2):-
    var(Var), !.


%regla logica ejercicio clave secreta



