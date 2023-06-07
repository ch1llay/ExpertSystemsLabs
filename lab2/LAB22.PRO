
%cartoon selection expert
%trace
domains
    conditions = integer*  
    history = integer*
    database
    rule(integer, symbol,symbol, conditions)
    cond(integer, symbol)
    yes(integer)
    no(integer)
predicates
    do_expert_job
    do_consulting
    goes(symbol)
    clear
    go(history, symbol)
    check(integer, history, conditions)
    Inpo(history, integer, integer, symbol)
    do_answer(history, integer, symbol,integer, integer)

clauses
    rule(1, "Cartoon",   "Series", [1]).
    rule(2, "Cartoon",   "Full-length cartoon", [2]).
    rule(3, "Series", "Mr. Pickles", [3,4]).
    rule(4, "Series", "Scooby Doo",[3,5,6,7]).
    rule(5, "Series","Adventure Time", [6,7,9]).
    rule(6, "Full-length cartoon", "Hotel Transylvania",  [3,4,6,7]).
    rule(7, "Full-length cartoon","Mr. Peabody & Sherman",[3,6,8,10]).
    rule(8, "Full-length cartoon", "Penguins of Madagascar",  [3,6,7,9]).
    rule(9, "Full-length cartoon", "The Princess and the Frog", [3,6,10]).
    rule(10, "Full-length cartoon", "St.Bernard", [5,6]).
    cond(1,"Series").
    cond(2,"Full-length cartoon").
    cond(3,"Comedy").
    cond(4,"Horror").
    cond(5,"Detective").
    cond(6,"Adventure").
    cond(7,"Fantastic").
    cond(8,"History").
    cond(9,"Thriller").
    cond(10,"Drama").
    do_expert_job:-
    makewindow(1,7,7,"Expert system", 0, 0, 25, 80),
    do_consulting, nl, nl, nl, nl, write("Press any key"),
    readchar(_), exit.
    do_consulting:- goes(Mygoal),go([],Mygoal),!.
    do_consulting:- nl, write("Sorry, I can't help you") ,clear.
    do_consulting.
    goes(Mygoal):- 
    clear,clearwindow, nl, nl,nl,nl,
    write("Welcome!"),nl, nl, nl,
    write("Cartoon identification"),nl,
    write("To start the identification process,"),nl,
    write("enter the word 'want'"), nl, nl, readln(Mygo),!.
    inpo(HISTORY,RNO,BNO,TEXT):- write("?:- ",TEXT," ? "),
    makewindow(2,8,8,"To answer a question",0,0,10,50),
    write("enter 1, if your answer is'yes' ,"),
    write("enter 2, if your answer is 'no' ,"),
    write("enter 0 for quitting"),nl,
    readint(RESPONSE),
    clearwindow,shiftwindow(1),
    do_answer(HISTORY,RNO,TEXT,BNO,RESPONSE).
    go(HISTORY, Mygoal):- rule(RNO,Mygoal,NY,COND),check(RNO,HISTORY,COND),!,go([RNO|HISTORY],NY).
    go(_,Mygoal):- not(rule(_,Mygoal,_,_)),!,nl,write("Probably your cartoon is ",Mygoal,"."), nl, nl, nl.
    check(RNO,HISTORY,[BNO|REST]):-yes(BNO),!,check(RNO,HISTORY,REST).
    check(_,_,[BNO|_]):- no(BNO),!,fail.
    check(RNO,HISTORY,[BNO|REST]):- cond(BNO,TEXT),   inpo(HISTORY,RNO,BNO,TEXT),
    check(RNO,HISTORY,REST).
    check(_,_,[]).
    do_answer(_,_,_,_,0):- exit.
    do_answer(_,_,_,BNO,1):- assert(yes(BNO)),write(yes),nl.
    do_answer(_,_,_,BNO,2):- assert(no(BNO)),write(no),nl,fail.
    clear:- retract(yes(_)),retract(no(_)),fail,!.
    clear.

goal
    do_expert_job.
    

