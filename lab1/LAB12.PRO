DOMAINS
    tree=tr(integer,tree,tree);e      
PREDICATES
    check(tree,tree)
    main.
CLAUSES
    check(X,X):-!.
    check(tr(_,Left,Right),Tree):-
    check(Left,Tree);check(Right,Tree).


main:-
 check(tr(5,
            tr(7,
                tr(9,e,e),tr(8,e,e)),
                tr(6,e,
                    tr(4,
                        tr(3,e,e),
                        tr(1,e,e)))), 
    tr(4,
        tr(3,e,e),
        
        tr(1,e,e))).

    /*
    check(tr(5,
            tr(7,
                tr(9,e,e),tr(8,e,e)),
                tr(6,e,
                    tr(4,
                        tr(3,e,e),
                        tr(1,e,e)))), 
    tr(4,
        tr(3,tr(1, e, e),e),
        
        tr(1,e,e))).
        */
