seis_amigos(MedTransp):-
    =(MedTransp, [Auto, Avion, Tren]),
    Auto = [ _, _ ],
    Avion = [ _, _ ],
    Tren = [ _, _ ],
    medio_transporte(alejandro, MedioAle, MedTransp),
    \==(MedioAle, auto),
    medio_transporte(benito, MedioBen, MedTransp),
    \==(MedioBen, avion),
    ==(MedioAle, MedioBen),
    medio_transporte(andres, avion, MedTransp),
    medio_transporte(carlos, MedioCar, MedTransp),
    \==(MedioCar, avion),
    medio_transporte(dario, MedioDar, MedTransp),
    \==(MedioCar, MedioDar),
    medio_transporte(tomas, _, MedTransp).


medio_transporte(Amigo, auto, [[Amigo, _], _, _]).
medio_transporte(Amigo, auto, [[_, Amigo], _, _]).

medio_transporte(Amigo, avion, [_, [Amigo, _], _]).
medio_transporte(Amigo, avion, [_, [_, Amigo], _]).

medio_transporte(Amigo, tren, [_, _, [Amigo, _]]).
medio_transporte(Amigo, tren, [_, _, [_, Amigo]]).

%Buscar que hace notrace. y nodebug.

