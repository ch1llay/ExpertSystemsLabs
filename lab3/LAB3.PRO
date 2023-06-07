%music group selection expert on rules
domains
database
	xpositive(symbol,symbol)
	xnegative(symbol,symbol)
predicates
	do_expert_job
	do_consulting
	ask(symbol,symbol)
	group_is(symbol)
	it_is(symbol)
	positive(symbol,symbol)
	negative(symbol,symbol)
	remember(symbol,symbol,symbol)
	clear_facts
goal
	do_expert_job.
clauses
group_is("Korol i shut"):-
	it_is("Russian"),
    it_is("Rock"),
	positive(has, "Male vocal"),
	positive(has, "Punk rock"),
	positive(has, "Fantasy rock"),!.
group_is("Aria"):-
	it_is("Russian"),
    it_is("Rock"),
	positive(has, "Male vocal"),
	positive(has, "Metal rock"),!.
group_is("Lyapis Trubeckoy"):-
	it_is("Russian"),
    it_is("Rock"),
	positive(has, "Male vocal"),
	positive(has, "Pop rock"),
	positive(has, "Punk rock"),!.
group_is("Zemfira"):-
	it_is("Russian"),
    it_is("Rock"),
	positive(has, "Female vocal"),
	positive(has, "Pop rock"),
	positive(has, "Punk rock"),!.
group_is("Metallica"):-
	it_is("English"),
    it_is("Rock"),
	positive(has, "Male vocal"),
	positive(has, "Hard rock"),
	positive(has, "Metal rock"),!.
group_is("The Cranberries"):-
	it_is("English"),
    it_is("Rock"),
	positive(has, "Female vocal"),
	positive(has, "Hard rock"),
	positive(has, "Pop rock"),
	positive(has, "Metal rock"),!.
group_is("Linkin Park"):-
	it_is("English"),
    it_is("Rock"),
	positive(has, "Male vocal"),
	positive(has, "With piano"),
	positive(has, "Pop rock"),!.

group_is("The Beatles"):-
	it_is("English"),
    it_is("Rock"),
	positive(has, "Male vocal"),
	positive(has, "Pop rock"),!.

group_is("The offspring"):-
	it_is("English"),
    it_is("Rock"),
	positive(has, "Male vocal"),
	positive(has, "Pop rock"),
	positive(has, "Punk rock"),!.

group_is("Ruki vverh"):-
	it_is("Russian"),
    it_is("Pop"),
	positive(has, "Male vocal"),
	positive(has, "Dancing"),
	positive(has, "Lyrics"),!.

group_is("Ivanushki International"):-
	it_is("Russian"),
    it_is("Pop"),
	positive(has, "Male vocal"),
	positive(has, "Dancing"),
	positive(has, "Upbeat rhythms"),!.

group_is("Vintazh"):-
	it_is("Russian"),
    it_is("Pop"),
	positive(has, "Female vocal"),
	positive(has, "Dancing"),
	positive(has, "Upbeat rhythms"),!.

group_is("Aqua"):-
	it_is("English"),
    it_is("Pop"),
	positive(has, "Female vocal"),
    positive(has, "Upbeat rhythms"),
	positive(has, "Simple text"),!.

group_is("ABBA"):-
	it_is("English"),
    it_is("Pop"),
	positive(has, "Female vocal"),
    positive(has, "Dancing"),
    positive(has, "Lyrics"), !.

group_is("Florida"):-
	it_is("English"),
    it_is("Pop"),
	positive(has, "Male vocal"),
    positive(has, "Dancing"),
    positive(has, "Upbeat rhythms"), !.

it_is("Russian"):-
	positive(is, "Russian"), !.
it_is("English"):-
	positive(is, "English"), !.
it_is("Rock"):- 
	positive(is, "Rock"), !.
it_is("Pop"):- 
	positive(is, "Pop"), !.
do_expert_job:-
	makewindow(1,7,7,"AN EXPERT SYSTEM",1,16,22,58), nl,
	write("* * * * * * * * * * * * * * * * * * * *"),nl,
	write(" WELCOME TO A MUSIC GROUP EXPERT SYSTEM "),nl,
	write(" "), nl,
	write("Please answer the question about "),nl,
	write("the music group you would like to watch"),nl,
	write("by typing in 'yes' or 'no'. "),nl,
	write("* * * * * * * * * * * * * * * * * * * *"),nl,
	do_consulting, readchar(_), nl,nl, removewindow, exit.
do_consulting :-group_is(X),!,nl,write("the music group you have indicated is ",X,"."),nl,clear_facts.
do_consulting :-nl,write("Sorry I can't help you ! "), clear_facts.
  ask(X,Y) :-write(" Question :- ",X," it ",Y," ?"),nl,readln(Reply), remember(X,Y,Reply).
positive(X,Y) :-xpositive(X,Y),!.
positive(X,Y) :-not(negative(X,Y)),!, ask(X,Y).
negative(X,Y) :-xnegative(X,Y),!.
remember(X,Y,yes) :-asserta(xpositive(X,Y)).
remember(X,Y,no) :-asserta(xnegative(X,Y)), fail.
clear_facts :-retract(xpositive(_,_)),fail.
clear_facts :-retract(xnegative(_,_)), fail.
