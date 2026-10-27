travel([]).
travel([X|Y]) :- write(X), nl, travel(Y).

count([], 0).
count([_|Y],N) :- count(Y, N1), N is N1 + 1.

addition([], 0).
addition([X|Y], R) :- addition(Y, R1), R is R1 + X.

concatenar([], L, L).
concatenar([H|T], L, [H|R]) :- concatenar(T, L, R).

encontrar_mayor :-
    write('Ingresa una lista de numeros: '), read(L),
    mayor(L, R),
    write('El numero mayor es: '),
    write(R).

mayor([X], X).
mayor([X|Y], R) :-
    mayor(Y, R1),
    %Esta linea basicamente es un if else
    (X > R1 -> R = X ; R = R1).
