%Integral de una constante:
i(Var, K, K*Var):-
    var(Var), number(K), !.

%Integral de una variable respecto a si misma:
i(Var, Var, 1/2*Var^2):-
    var(Var), !.

%Integral de una variable elevada a la N:
i(Var, Var^N, 1/Nm1*Var^Nm1):-
    var(Var), number(N), is(Nm1, +(N,1)), !.

%Integral de una constante por una variable elevada a la N:
%ie(X, 3*X^5, IFx), is(X,10). //para evaluar en X = 10
%ie(X, 3*X^5, IFx), assert((evalIFx(X,W):-is(W, IFx))). //permite guardar la funcion con asssert para poder probar 
%is(Li,2), evalIFx(Li, ILi), is(Ls, 4), evalIFx(Ls, ILs), is(Area, -(ILs, ILi)).  //para poder probar con los limites
%listing(evalIFx). //para imprimir que funcion esta guardada
%abolish(evalIFx, 2), ie(X, 3*X^5, IFx), assert((evalIFx(X,W):-is(W, IFx))). //para limpiar el listing de la funcion con la que evaluamos
i(Var, K*Var^N, K/Nm1*Var^Nm1):-
    var(Var), number(K), number(N), is(Nm1, +(N,1)), !.




integralDefinida(Var, Expr, LimInf, LimSup, Area):-
    abolish(evall, 2),
    i(Var, Expr, R),
    asserta((evall(Var, W):- is(W, R))),
    evall(LimInf, LI),
    evall(LimSup, LS),
    is(Area, -(LS, LI)).
    