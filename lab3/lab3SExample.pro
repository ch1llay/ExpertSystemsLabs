%cartoon selection expert on rules
domains
database
	xpositive(symbol,symbol)
	xnegative(symbol,symbol)
predicates
	do_expert_job
	do_consulting
	ask(symbol,symbol)
	cartoon_is(symbol)
	it_is(symbol)
	positive(symbol,symbol)
	negative(symbol,symbol)
	remember(symbol,symbol,symbol)
	clear_facts
goal
	do_expert_job.
clauses
cartoon_is("Mr. Pickles"):-
	it_is("Series"),
	positive(has, "Comedy"),
	positive(has, "Horror"),!.
cartoon_is("Scooby Doo"):-
	it_is("Series"),
	positive(has, "Comedy"),
	positive(has, "Detective"),
	positive(has, "Adventure"),
	positive(has, "Fantastic"),!.
cartoon_is("Adventure Time"):-
	it_is("Series"),
	positive(has, "Adventure"),
	positive(has, "Fantastic"),
	positive(has, "Thriller"),!.
cartoon_is("Hotel Transylvania"):-
	it_is("Full-length cartoon"),
	positive(has, "Comedy"),
	positive(has, "Horror"),
	positive(has, "Adventure"),
	positive(has, "Fantastic"),!.
cartoon_is("Mr. Peabody & Sherman"):-
	it_is("Full-length cartoon"),
	positive(has, "Comedy"),
	positive(has, "Adventure"),
	positive(has, "History"),
	positive(has, "Drama"),!.
cartoon_is("Penguins of Madagascar"):-
	it_is("Full-length cartoon"),
	positive(has, "Comedy"),
	positive(has, "Adventure"),
	positive(has, "Thriller"),
	positive(has, "Fantastic"),!.
cartoon_is("The Princess and the Frog"):-
	it_is("Full-length cartoon"),
	positive(has, "Comedy"),
	positive(has, "Adventure"),
	positive(has, "Drama"),!.
cartoon_is("St.Bernard"):-
	it_is("Full-length cartoon"),
	positive(has, "Detective"),
	positive(has, "Adventure"),!.
it_is("Series"):-
	positive(is, "Series"), !.
it_is("Full-length cartoon"):- 
	positive(is, "Full-length cartoon"), !.
do_expert_job:-
	makewindow(1,7,7,"AN EXPERT SYSTEM",1,16,22,58), nl,
	write("* * * * * * * * * * * * * * * * * * * *"),nl,
	write(" WELCOME TO A CARTOON EXPERT SYSTEM "),nl,
	write(" "), nl,
	write("Please answer the question about "),nl,
	write("the cartoon you would like to watch"),nl,
	write("by typing in 'yes' or 'no'. "),nl,
	write("* * * * * * * * * * * * * * * * * * * *"),nl,
	do_consulting, readchar(_), nl,nl, removewindow, exit.
do_consulting :-cartoon_is(X),!,nl,write("the cartoon you have indicated is ",X,"."),nl,clear_facts.
do_consulting :-nl,write("Sorry I can't help you ! "), clear_facts.
  ask(X,Y) :-write(" Question :- ",X," it ",Y," ?"),nl,readln(Reply), remember(X,Y,Reply).
positive(X,Y) :-xpositive(X,Y),!.
positive(X,Y) :-not(negative(X,Y)),!, ask(X,Y).
negative(X,Y) :-xnegative(X,Y),!.
remember(X,Y,yes) :-asserta(xpositive(X,Y)).
remember(X,Y,no) :-asserta(xnegative(X,Y)), fail.
clear_facts :-retract(xpositive(_,_)),fail.
clear_facts :-retract(xnegative(_,_)), fail.
