trace
nowarnings
domains
	edg = symbol*
	edges = edg*
predicates
    edge(symbol, symbol)
    way(symbol, symbol)
    oneEdge(symbol, symbol, edg).
    getEdges(symbol, edges).
    removeEdge(edg, edges, edges).
    main.
    cycle(symbol,edges,edges, edg).
    clear(edges, edges).
    equil(edges, edges).
clauses
	
    edge(a, b).
    edge(b, c).
    edge(c, d).
    edge(d, a).

    way(A, B) :- edge(A, B);edge(B, A).
    oneEdge(A, B, [A, B]):- way(A, B).
    getEdges(A, L):- findall(Edg, oneEdge(A,_, Edg), L).
    removeEdge([A, B], [[A,B]|TIn], Out) :- 
    	removeEdge([A, B], TIn, Out).
    removeEdge([A, B], [[B, A]|TIn], Out) :-
    	removeEdge([A, B], TIn, Out).
    removeEdge([A, B], [HIn|TIn], [HOut|TOut]) :-
    	HOut = HIn,
    	 removeEdge([A, B], TIn, TOut).
    removeEdge([A, B], _, Res) :- !.
    
    clear(E, []).
    equil(L, L).
    cycle(A, CurEdges,_, [H|T]) :-
      way(A,B),
      removeEdge([A,B], CurEdges, Temp),
      equil(CurEdges, Temp)), fail, !.
      H=A, cycle(B, Temp,_, T), !.
   cycle(A, CurEdges,_, [H|T]) :-
   	way(A, B),
   	H = A, cycle(B,CurEdges, _, T).
    
    main() :- 
    	getEdges(a, L), removeEdge([a, b], L, Res), write(Res).
    

