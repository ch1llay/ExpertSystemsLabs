% Эксперт по породам собак. Продукционная система, базирующаяся на правилах
%domains
DATABASE
	xpositive(symbol,symbol)
	xnegative(symbol,symbol)
PREDICATES
	do_expert_job
	do_consulting
	ask(symbol,symbol)
	dog_is(symbol)
	it_is(symbol)
	positive(symbol,symbol)
	negative(symbol,symbol)
	remember(symbol,symbol,symbol)
	clear_facts
CLAUSES
	/* Система пользовательского интерфейса */
	do_expert_job :-
		makewindow(1,7,7,"AN EXPERT SYSTEM",1,16,22,58),
		nl,write("* * * * * * * * * * * * * * * * * * * *"),
		nl,write(" WELCOME TO A DOG EXPERT SYSTEM "),
		nl,write(" "),
		nl,write("This is a dog identification system. "),
		nl,write("Please answer the question about "),
		nl,write("the dog you would like by typing in "),
		nl,write("'yes' or 'no'. "),
		nl,write("* * * * * * * * * * * * * * * * * * * *"), nl,nl,
		do_consulting,
		write("Press space bar."),nl,
		readln(_),
		removewindow, exit.
	do_consulting :-
		dog_is(X),!,nl,
		write("the dog you have indicated is a(n)",X,"."),nl,
		clear_facts.
	do_consulting :-
		nl,write("Sorry I can't help you!"),
		clear_facts.
	ask(X,Y) :-
		write("Question :- ",X," it ",Y," ?"),
		readln(Reply),
		remember(X,Y,Reply).
	/* МЕХАНИЗМ ВЫВОДА */
	positive(X,Y) :- xpositive(X,Y),!.
	positive(X,Y) :-
		not( negative(X,Y)),!,
		ask(X,Y).
	negative(X,Y) :-
		xnegative(X,Y),!.
	remember(X,Y,yes) :-
		asserta(xpositive(X,Y)).
	remember(X,Y,no) :-
		asserta(xnegative(X,Y)), fail.
	clear_facts :-
		retract(xpositive(_,_)), fail.
	clear_facts :-
		retract(xnegative(_,_)), fail.
	/* ПРОДУКЦИОННЫЕ ПРАВИЛА */
	dog_is("English Bulldog") :-
		it_is("short-haired dog"),
		positive(has,"height under 22 inches"),
		positive(has,"low-set tail"),
		positive(has,"good natured personality"),!.
	dog_is("Beagle") :-
		it_is("short-haired dog"),
		positive(has,"height under 22 inches"),
		positive(has,"longer ears"),
		positive(has,"good natured personality"),!.
	dog_is("Great Dane") :-
		it_is("short-haired dog"),
		positive(has,"low-set tail"),
		positive(has,"good natured personality"),
		positive(has,"weight over 100 lb"),!.
	dog_is("American Foxhound") :-
		it_is("short-haired dog"),
		positive(has,"height under 30 inches"),
		positive(has,"longer ears"),
		positive(has,"good natured personality"),!.
	dog_is("Cocker Spaniel") :-
		it_is("long-haired dog"),
		positive(has,"height under 22 inches"),
		positive(has,"low-set tail"),
		positive(has,"longer ears"),
		positive(has,"good natured personality"),!.
	dog_is("Irish Setter") :-
		it_is("long-haired dog"),
		positive(has,"height under 30 inches"),
		positive(has,"longer ears"),!.
	dog_is("Collie") :-
		it_is("long-haired dog"),
		positive(has,"height under 30 inches"),
		positive(has,"low-set tail"),
		positive(has,"good natured personality"),!.
	dog_is("St. Bernard") :-
		it_is("long-haired dog"),
		positive(has,"low-set tail"),
		positive(has,"good natured personality"),
		positive(has,"weight over 100 lb"),!.
	it_is("short-haired dog") :-
		positive(has,"short-haired"),!.
	it_is("long-haired dog") :-
		positive(has,"long-haired"),!.
goal
	do_expert_job.