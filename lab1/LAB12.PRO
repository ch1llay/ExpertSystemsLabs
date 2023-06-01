trace
DOMAINS
    tree=tr(integer,tree,tree);e      
PREDICATES
    check(tree,tree)
    main.
CLAUSES
    check(X,X):-!.
    check(tr(_, L1, R1), Tree):-
        check(L1, Tree);check(R1, Tree).
    check(tr(_,L1,R1), tr(_, L2, R2)):-
    check(L1,L2),check(R1,R2).
    
    check(tr(_, L1, R1), tr(_, L2, R2)) :-
    	check(L1, R2),check(L2,R1). 


main:-
 check(tr(2,
            tr(4, 
                tr(6, 
                    e, e),
                tr(7, e, e)),
            tr(5, e, e)),
        tr(1, 
            tr(2, 
                tr(4,e, e),
                tr(5, 
                    tr(6, e, e),
                    tr(7, e, e))),
            tr(3, e, e))).