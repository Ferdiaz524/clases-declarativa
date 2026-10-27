sum(Var1, Var2, Var1 + Var2, R):-
atomic(Var1), atomic(Var2), number(Var1), number(Var2), is(R, Var1 + Var2).

rest(Var1, Var2, R):-
atomic(Var1), atomic(Var2), number(Var1), number(Var2), is(R, Var1 - Var2).