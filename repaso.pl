% 345
mostrarDigitos(0):- !.
mostrarDigitos(X):-
    X > 0,
    Digito is X mod 10,%5
    Resto is X // 10,%34
    mostrarDigitos(Resto),
    writeln(Digito).

almacenar(0, []):- !.
almacenar(N, [H|T]):-
    H is N mod 10,
    N1 is N // 10,
    almacenar(N1, T).    

extraerPares(0, []):- !.
extraerPares(N, [H|T]):-
    H is N mod 10,
    H mod 2 =:= 0,
    N1 is N // 10,
    extraerPares(N1, T).

extraerPares(N, L):-
    H is N mod 10,
    H mod 2 =\= 0,
    N1 is N // 10,
    extraerPares(N1, L).

extraerMayoresA5(0, []):- !.
extraerMayoresA5(N, [H|T]):-
    H is N mod 10,
    H > 5, 
    N1 is N // 10,
    extraerMayoresA5(N1, T).

extraerMayoresA5(N, L):-
    H is N mod 10,
    H =< 5, 
    N1 is N // 10,
    extraerMayoresA5(N1, L).

crearSecuencia(X, 0, [X]):- !.
crearSecuencia(X, N, [H|T]):-
    H is X + N,
    N1 is N - 1,
    crearSecuencia(X, N1, T).

repetir(0, _, []):- !.
repetir(N, Elem, [H|T]):-
    H = Elem,
    N1 is N - 1,
    repetir(N1, Elem, T).
%              in  out
crearSecuencia([], []):- !.
crearSecuencia([[N, Elem]| Resto], [Sublista| T]):-
    repetir(N, Elem, Sublista),
    crearSecuencia(Resto, T).

invertir([], []) :- !.
invertir([[A, B]| Resto], [[B, A]|T]):-
    invertir(Resto, T).

duplicar([], []) :- !.
duplicar([X| Resto], [[X,X]|T]):-
    duplicar(Resto, T).

number_length(0, 0):- !.
number_length(N, R):-
    N > 0,
    N1 is N // 10,
    number_length(N1, R1),
    R is R1 + 1.

generarLista_aux(0, 0, []):- !.
generarLista_aux(M, N, [Prod|T]):-
    M > 0,
    N > 0,
    D1 is M mod 10,
    D2 is N mod 10,
    Prod is D1 * D2,
    Sig1 is M // 10,
    Sig2 is N // 10,
    generarLista_aux(Sig1, Sig2, T).

generarLista(M, N, Resultado):-
    number_length(M, L1),
    number_length(N, L2),
    L1 =:= L2,
    generarLista_aux(M, N, ListaInvertida),
    reverse(ListaInvertida, Resultado).

generarLista(M, N, Resultado):-
    number_length(M, L1),
    number_length(N, L2),
    L1 =\= L2,
    writeln('Error: Los numeros no tienen la misma cantidad de digitos.'),
    fail.
    
sumarLista([], 0):- !.
sumarLista([H|T], SumaTotal):-
    sumarLista(T, SumaAnt),
    SumaTotal is SumaAnt + H.

sumarBloques([], []):- !.
sumarBloques([Sublista|Resto], [Suma| T]):-
    sumarLista(Sublista, Suma),
    sumarBloques(Resto, T).


filtrarPorTamano([], _, []) :- !.

% Caso 1: La sublista actual CUMPLE (L >= MinTam) -> Se conserva en la salida
filtrarPorTamano([Sublista | Resto], MinTam, [Sublista | T]) :-
    length(Sublista, L),
    L >= MinTam, !,
    filtrarPorTamano(Resto, MinTam, T).

% Caso 2: La sublista NO cumple (L < MinTam) -> Se descarta y se continúa
filtrarPorTamano([_ | Resto], MinTam, T) :-
    filtrarPorTamano(Resto, MinTam, T).

