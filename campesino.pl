% Problema del campesino:
juego_campesino(EI):-
	% Se asume el orden: campesino, zorra, gallina, granos.
	=(EI, [izq, izq, izq, izq]), % Estado inicial único.
	Estados = [EI], % Estructura de datos con historial de movimientos válidos.
	cruzar_rio(EI, Estados). % Invocar la cláusula recursiva.

cruzar_rio([der, der, der, der], Estados):-
	write('FIN DEL JUEGO'), nl, nl,
	reverse(Estados, Solucion),
	write(Solucion), nl, nl.

cruzar_rio(Ubicacion, Estados):-
	trasladar(Ubicacion, UbicacionSig),
	not(prohibido(UbicacionSig)),
	guardar_estado(Estados, UbicacionSig, EstadosSig),
	cruzar_rio(UbicacionSig, EstadosSig).

guardar_estado(Estados, Ubicacion2, [Ubicacion2|Estados]):-
	not(member(Ubicacion2, Estados)).

% El orden en cada lista es: Campesino, Zorra, Gallina, Granos.
trasladar([izq, Zorra, Gallina, Granos], [der, Zorra, Gallina, Granos]).
trasladar([der, Zorra, Gallina, Granos], [izq, Zorra, Gallina, Granos]).

trasladar([izq, izq, Gallina, Granos], [der, der, Gallina, Granos]).
trasladar([der, der, Gallina, Granos], [izq, izq, Gallina, Granos]).

trasladar([izq, Zorra, izq, Granos], [der, Zorra, der, Granos]).
trasladar([der, Zorra, der, Granos], [izq, Zorra, izq, Granos]).

trasladar([izq, Zorra, Gallina, izq], [der, Zorra, Gallina, der]).
trasladar([der, Zorra, Gallina, der], [izq, Zorra, Gallina, izq]).

% Restricciones:
prohibido([izq, der, der, izq]).
prohibido([der, izq, izq, der]).
prohibido([der, der, izq, izq]).
prohibido([izq, izq, der, der]).





