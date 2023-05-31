%trace
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
    not_equil(edges, edges).
    nodes(edg).
    len(edg, integer).
 
clauses
    nodes([a,b,c,d]).	
    edge(a, b).
    edge(b, c).
    edge(c, d).
    edge(d, a).
    
    len([], 0):- !.
    len([H|T], N) :- len(T, L), N = L + 1. 

    way(A, B) :- edge(A, B);edge(B, A).
    oneEdge(A, B, [A, B]):-way(A, B).
    getEdges(_, L):- findall(Edg, oneEdge(_,_, Edg), L).
    removeEdge(In, [], Out).
    removeEdge([A, B], [[A,B]|TIn], Out) :-!, 
    	removeEdge([A, B], TIn, Out).
    removeEdge([A, B], [[B, A]|TIn], Out) :-!,
    	removeEdge([A, B], TIn, Out).
    removeEdge(In, [HIn|TIn], [HOut|TOut]) :-!,
    	HOut = HIn,
    	 removeEdge(In, TIn, TOut), !.
    removeEdge([A, B], [], Res).
    

    clear(E, []).
    equil([[A,B]|TIn], [[A,B]|TOut]) :-equil(Tin, TOut).
    equil([], []):-!,write("equil"), nl, fail.
    
    not_equil(E1, E2) :- not(equil(E1, E2)), write("not equil"), nl. 
    	
   cycle(_, [], _, Res).
    cycle(A, CurEdges,_, [H|T]) :-
      way(A,B),
      Cur = CurEdges,!,
      removeEdge([A,B], Cur, Temp),nl, write(Temp), nl,!,
  
      not_equil(CurEdges, Temp),!,
      H=A, cycle(B, Temp,_, T), !.
      
    main() :- 
    	getEdges(a, L), 
    	write(L), 
    	readln(_),
    	 cycle(_, L, _, Res), len(Res, N),
    	 nodes(Nodes), len(Nodes, NN),
    	 write(N), nl, write(NN), nl,
    	 N = NN,
    	 write(Res).
    