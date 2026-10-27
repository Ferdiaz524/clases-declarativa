lista_a([mesa, casa, plato, olla, cacerola]).

lista_b([3, 7, 7, 589, 993, 791, 814, 1089]).

lista_c([verde, rojo, aqua, azul, amarillo, cafe]).

% Base Case
list_length([],0).

% recursive Case
list_length([_|TAIL],N) :- list_length(TAIL,TailLength), N is TailLength + 1.

%concatenar
list_concat([],L,L).
list_concat([X1|L1],L2,[X1|L3]) :- list_concat(L1,L2,L3).

%eliminar
list_delete(X, [X], []).
list_delete(X,[X|L1], L1).
list_delete(X, [Y|L2], [Y|L1]) :- list_delete(X,L2,L1).

%insertar al inicio
insert_head(X, L, [X|L]).
%insertar al final
insert_tail(X, L, R) :- append(L, [X], R).
%insertar a lista
list_insert(X, L, R) :- list_delete(X, R, L).

%orden asc
list_order_asc([]).
list_order_asc([_]).
list_order_asc([X, Y | Tail]) :- X =< Y, list_order_asc([Y|Tail]).

%orden desc
list_order_desc([]).
list_order_desc([_]).
list_order_desc([X, Y | Tail]) :- X >= Y, list_order_desc([Y|Tail]).

%merge sort
mergesort([],[]).
mergesort([A],[A]).
mergesort([A,B|R],S) :-   split([A,B|R],L1,L2),   mergesort(L1,S1),   mergesort(L2,S2),   merge(S1,S2,S).
split([],[],[]).
split([A],[A],[]).
split([A,B|R],[A|Ra],[B|Rb]) :-   split(R,Ra,Rb).
merge(A,[],A).
merge([],B,B).
merge([A|Ra],[B|Rb],[A|M]) :-   A =< B, merge(Ra,[B|Rb],M).
merge([A|Ra],[B|Rb],[B|M]) :-   A > B, merge([A|Ra],Rb,M).