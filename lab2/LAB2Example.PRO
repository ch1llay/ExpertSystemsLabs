DOMAINS
	CONDITIONS = BNO *
	HISTORY = RNO *
	RNO, BNO, FNO = INTEGER
	CATEGORY = SYMBOL
DATABASE
	rule(RNO, CATEGORY, CATEGORY,CONDITIONS)
	cond(BNO, STRING)
	yes(BNO)
	no(BNO)
	topic(string)
PREDICATES
	do_expert_job
	show_menu
	do_consulting
	process(integer)
	info(CATEGORY)
	goes(CATEGORY)
	listopt
	erase
	clear
	eval_reply(char)
	go(HISTORY, CATEGORY)
	check(RNO, HISTORY, CONDITIONS)
	notes(BNO)
	inpo(HISTORY, RNO, BNO, STRING)
	do_answer(HISTORY, RNO, STRING, BNO, INTEGER)
CLAUSES
	topic("dog").
	topic("short-haired dog").
	topic("long-haired dog").
	rule(1, "dog", "short-haired dog", [1]).
	rule(2, "dog", "long-haired dog", [2]).
	rule(3, "short-haired dog","English Bulldog ", [3,5,7]).
	rule(4, "short-haired dog","Beagle", [3,6,7]).
	rule(5, "short-haired dog","Great Dane", [5,6,7,8]).
	rule(6, "short-haired dog","American Foxhound",[4,6,7]).
	rule(7, "long-haired dog", "Cocker Spaniel", [3,5,6,7]).
	rule(8, "long-haired dog", "Irish Setter", [4,6]).
	rule(9, "long-haired dog", "Collie", [4,5,7]).
	rule(9, "long-haired dog", "St. Bernard", [5,7,8]).
	cond(1, "short-haired").
	cond(2, "long-haired").
	cond(3, "height under 22 inches").
	cond(4, "height under 30 inches").
	cond(5, "low-set tail").
	cond(6, "longer ears").
	cond(7, "good natured personality").
	cond(8, "weight over 100 lb").
	do_expert_job:-
		makewindow(1,7,7," DOG EXPERT SYSTEM ",0,0,25,80),
		show_menu, nl,write(" Press space bar. "),
		readchar(_), exit.
	show_menu:-write(" "),nl,
		write(" * * * * * * * * * * * * * * * * * * "),nl,
		write(" * DOG EXPERT * "),nl,
		write(" * * "),nl,
		write(" * 1. Consultation * "),nl,
		write(" * 2. Exit the system * "),nl,
		write(" * * "),nl,
		write(" * * * * * * * * * * * * * * * * * * "),nl,
		write(" "),nl,
		write("Please enter your choice: 1 or 2: "),nl,
		readint(Choice),
		process (Choice).
	process(1):-do_consulting.
	process(2):-removewindow, exit.
	do_consulting:-
		goes(Mygoal), go([],Mygoal),!.
	do_consulting:-nl, write(" Sorry I can't help you."), clear.
	do_consulting.
	goes(Mygoal):-clear, clearwindow,nl,nl, write(" "),nl,
		write(" WELCOME TO THE DOG EXPERT SYSTEM "),nl,
		write(" "),nl,
		write("This is a dog identification system. "),nl,
		write("To begin the process of choosing a "),nl,
		write("dog, please type in 'dog'. If you "),nl,
		write("wish to see the dog types, please "),nl,
		write("type in a question mark (?). "),nl,
		write(" "),nl,
		readln(Mygoal), info(Mygoal),!.
	info("?"):-clearwindow, write("Reply from the KBS."),nl,
		listopt, nl,write("Please any key. "),
		readchar(_), clearwindow,exit.
	info(X):- X >< "?".
	listopt:-
		write("The dog types are: "),nl,nl, topic(Dog),
		write(" ",Dog),nl, fail.
	listopt.
	inpo(HISTORY,RNO,BNO,TEXT):-
		write("Question:- ",TEXT,"? "),
		makewindow(2,7,7,"Response",10,54,7,20),
		write("Type 1 for 'yes',"),nl,
		write("Type 2 for 'no': "),nl,
		readint(RESPONSE), clearwindow,
		shiftwindow(1),
		do_answer(HISTORY,RNO,TEXT,BNO,RESPONSE).
	eval_reply('y'):-
		write(" I hope you have found this helpful!").
	eval_reply('n'):-
		write(" I am sorry I can't help you!").
	go(_,Mygoal):-
		not(rule(_,Mygoal,_,_)),!,
		nl,write(" The dog you have indicated is a(n) ",
		Mygoal,"."),nl,
		write("Is a dog you would like to have (y/n)?"),
		nl,readchar(R),
		eval_reply(R).
	go(HISTORY, Mygoal):-
		rule(RNO,Mygoal,NY,COND),
		check(RNO,HISTORY,COND),
		go([RNO|HISTORY],NY).
	check(RNO,HISTORY,[BNO|REST]):-
		yes(BNO),!,
		check(RNO,HISTORY,REST).
	check(_,_,[BNO|_]):- no(BNO),!,fail.
	check(RNO,HISTORY,[BNO|REST]):-
		cond(BNO,NCOND),
		fronttoken(NCOND,"not",COND),
		frontchar(COND,_,COND),
		cond(BNO1,COND),
		notes(BNO1),!,
		check(RNO,HISTORY,REST).
	check(_,_,[BNO|_]):-
		cond(BNO,NCOND),
		fronttoken(NCOND,"not",COND),
		frontchar(COND,_,COND),
		cond(BNO1,COND),
		yes(BNO1),
		!,fail.
	check(RNO,HISTORY,[BNO|REST]):-
		cond(BNO,TEXT),
		inpo(HISTORY,RNO,BNO,TEXT),
		check(RNO,HISTORY,REST).
	check(_,_,[]).
	notes(BNO):- no(BNO),!.
	notes(BNO):- not(yes(BNO)),!.
	do_answer(_,_,_,_,0):- exit.
	do_answer(_,_,_,BNO,1):-
		assert(yes(BNO)),
		shiftwindow(1),
		write(yes),nl.
	do_answer(_,_,_,BNO,2):-
		assert(no(BNO)), write(no),nl, fail.
	erase:- retract(_),fail.
	erase.
	clear:- retract(yes(_)),retract(no(_)),fail,!.
	clear.
goal
	do_expert_job.
