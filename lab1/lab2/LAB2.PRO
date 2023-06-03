
%music selection expert
%trace
domains
    conditions = integer*
    history = integer*
    database
    rule(integer, symbol,symbol,symbol conditions)
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
    rule(1, "Rock","Russian", "Korol i shut", [1, 2]).
    rule(1, "Rock", "Russian", "Aria", [1, 2]).
    rule(1, "Rock", "Russian", "Lyapis Trubeckoy", [1, 2]).
    rule(1, "Rock", "English", "Metallica", [1, 2]).
    rule(1, "Rock", "English", "Linkin Park", [1, 2]).
    rule(1, "Rock", "English","The Beatles", [1, 2]).
    rule(1, "Rock", "English","The offspring", [1, 2]).
    rule(2, "Pop", "Russian", "Ruki vverh", [3, 4]).
    rule(2, "Pop", "Russian", "Ivanushki International", [3, 4]).
    rule(2, "Pop", "Russian", "Vintazh", [3, 4]).
    rule(2, "Pop", "English","Aqua", [3, 4]).
    rule(2, "Pop", "English","ABBA", [3, 4]).
    rule(2, "Pop", "English","Florida", [3, 4]).

    cond(3,"Rock").
        cond(30, "with piano").
        cond(31,"Hard rock").
        cond(32,"Pop rock").
        cond(33,"Metal rock").
        cond(34,"Punk rock").

    

    cond(4,"Pop").
        cond(41,"Dancing").
        cond(42,"Lyric").
        cond(43,"Metal rock").
        cond(44,"Punk rock").
   
    
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
    write("Music identification"),nl,
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
    go(_,Mygoal):- not(rule(_,Mygoal,_,_)),!,nl,write("Probably your music is ",Mygoal,"."), nl, nl, nl.
    check(RNO,HISTORY,[BNO|REST]):-yes(BNO),!,check(RNO,HISTORY,REST).
    check(_,_,[BNO|_]):- no(BNO),!,fail.
    check(RNO,HISTORY,[BNO|REST]):- cond(BNO,TEXT),   inpo(HISTORY,RNO,BNO,TEXT),
    check(RNO,HISTORY,REST).
    check(_,_,[]).
    do_answer(_,_

ChatGPT, [03.06.2023 16:56]
,_,_,0):- exit.
    do_answer(_,_,_,BNO,1):- assert(yes(BNO)),write(yes),nl.
    do_answer(_,_,_,BNO,2):- assert(no(BNO)),write(no),nl,fail.
    clear:- retract(yes(_)),retract(no(_)),fail,!.
    clear.

goal
    do_expert_job.
