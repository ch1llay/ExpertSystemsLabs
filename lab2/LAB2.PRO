
%music selection expert
%trace
domains
    conditions = integer*
    history = integer*
database
    rule(integer, symbol,symbol,symbol,conditions)
    cond(integer, symbol)
    yes(integer)
    no(integer)
    
predicates
    do_expert_job
    do_consulting
    get_goals(symbol, symbol)
    clear
    go(history, symbol, symbol, symbol, integer)
    check_current_rule(integer, history, conditions)
    GetUserAnswer(history, integer, integer, symbol)
    do_answer(history, integer, symbol,integer, integer)
    topicLanguage(integer, symbol).
    topicStyle(integer, symbol).
    
clauses
    topicLanguage(1, "Russian").
    topicLanguage(2, "English").
    topicStyle(1, "Rock").
    topicStyle(2, "Pop").
    rule(1, "Russian", "Rock", "Korol i shut", [1, 15, 16]).
    rule(2,  "Russian", "Rock", "Aria", [1, 14]).
    rule(3,  "Russian", "Rock", "Lyapis Trubeckoy", [1, 13, 15]).
    rule(3,  "Russian", "Rock", "Zemfira", [2, 13, 15]).
    rule(4,  "English", "Rock", "Metallica", [1, 12, 14]).
    rule(4,  "English", "Rock", "The Cranberries", [2, 12, 13, 14]).
    rule(5,  "English", "Rock", "Linkin Park", [1, 11, 13]).
    rule(6,  "English", "Rock","The Beatles", [1, 13]).
    rule(7,  "English", "Rock","The offspring", [1, 13, 15]).
    rule(8, "Russian", "Pop", "Ruki vverh", [1, 21, 22]).
    rule(9, "Russian", "Pop", "Ivanushki International", [1, 3, 4]).
    rule(10, "Russian",  "Pop", "Vintazh", [2, 21, 23]).
    rule(11, "English",  "Pop","Aqua", [2, 21, 23, 24]).
    rule(12, "English",  "Pop","ABBA", [2, 21,22]).
    rule(13, "English",  "Pop","Florida", [1, 21,23]).

        cond(1, "Male vocal").
        cond(2, "Female vocal").
        cond(11, "with piano").
        cond(12,"Hard rock").
        cond(13,"Pop rock").
        cond(14,"Metal rock").
        cond(15,"Punk rock").
        cond(16,"Fantasy rock").

    
        cond(21,"Dancing").
        cond(22,"Lyrics").
        cond(23,"Upbeat rhythms").
        cond(24,"Simple text").
   
    
    do_expert_job:-
        makewindow(1,7,7,"Expert system", 0, 0, 25, 80),
        do_consulting, nl, nl, nl, nl, write("Press any key"),
        readchar(_), exit.
    do_consulting:-
		 
        get_goals(Mygoal1, Mygoal2),go([],Mygoal1, Mygoal2, NY, 0),!, write("NY - ", NY).
    do_consulting:-
		 
        nl, write("Sorry, I can't help you") ,clear.
    do_consulting.

    get_goals(Mygoal1, Mygoal2):-
        clear,clearwindow, nl, nl,nl,nl,
        write("Welcome!"),nl, nl, nl,
        write("Music identification"),nl,
        write("To start the identification process,"),nl,
        write("enter music language "), 
            nl, write("1 - Russian"), nl, write("2 - English"), nl, 
            readint(Ans1), topicLanguage(Ans1, Mygoal1),
        write("enter music style "), 
            nl, write("1 - Rock"), nl, write("2 - Pop"), nl, 
            readint(Ans2), topicStyle(Ans2, Mygoal2),!.
    
    GetUserAnswer(RuleHistory,RullNumber,CondNumber,TEXT):-
        write("?:-",TEXT," ? "),
        makewindow(2,8,8,"To answer a question",0,0,10,50),
        write("enter 1, if your answer is'yes' ,"),
        write("enter 2, if your answer is 'no' ,"),
        write("enter 0 for quitting"),nl,
        readint(Answer),
        clearwindow,shiftwindow(1),
        do_answer(RuleHistory,RullNumber,TEXT,CondNumber,Answer).

    go(RuleHistory, Mygoal1, Mygoal2, NY, 0):-
        rule(RullNumber,Mygoal1,Mygoal2,NY,COND),
        check_current_rule(RullNumber,RuleHistory,COND),
        nl,!,
        go([RullNumber|RuleHistory],Mygoal1, Mygoal2, NY, 1).
    go(_,Mygoal1, Mygoal2, NY, 1):-
        nl,
        write("Probably your music for ",Mygoal1," ", Mygoal2,"", "."),
        nl, nl, nl.
        
    check_current_rule(RullNumber,RuleHistory,[CondNumber|REST]):-
        yes(CondNumber),!,check_current_rule(RullNumber,RuleHistory,REST).
    check_current_rule(_,_,[CondNumber|_]):-
		no(CondNumber),!,fail.
    check_current_rule(RullNumber,RuleHistory,[CondNumber|REST]):-
		cond(CondNumber,TEXT),   
        GetUserAnswer(RuleHistory,RullNumber,CondNumber,TEXT),
        check_current_rule(RullNumber,RuleHistory,REST).
        check_current_rule(_,_,[]).

    do_answer(_,_,_,_,0):-exit.
    do_answer(_,_,_,CondNumber,1):-
		assert(yes(CondNumber)),write(yes),nl.
    do_answer(_,_,_,CondNumber,2):-
		assert(no(CondNumber)),write(no),nl,fail.
    clear:-
		retract(yes(_)),retract(no(_)),fail,!.
    clear.

goal
    do_expert_job.
