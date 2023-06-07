domains
	conditions = integer*
	variants = integer*
database
	positive(integer,integer)
predicates
	ruleConditionals(integer,string)
	valuesRuleConditionals(integer,integer,string)
	rule(integer,string)
	cond(integer,string)
	year(integer)
	frontmen(integer)
	foundationCity(integer)
	amount_members(integer)
	conditionals_elements(conditions)
	expertism()
	startWork()
	consultt(integer)
	getAnswer(integer)
	remember(integer)
	goOnChoosing()
	eqstr(string)
	show(integer)
	ask(integer)
	clear()
	member(integer,conditions)
	chooseHelper(integer, integer, variants)
clauses
	% определения атрибутов группы для перехода по правилам
	ruleConditionals(1,"Year").
	ruleConditionals(2,"Frontman").
	ruleConditionals(3,"FondationCity").
	ruleConditionals(4,"Amount memebers").

	% вспомогательный предикат, для облегечения перехода по правилам при использовании
	positive(0, 0).
	chooseHelper(0, 0, [0]).
	chooseHelper(1, 1, [8]).
	chooseHelper(1, 2, [13]).
	chooseHelper(1, 3, [5]).
	chooseHelper(1, 4, [9]).
	chooseHelper(1, 5, [2]).
	chooseHelper(1, 6, [1]).
	chooseHelper(1, 7, [6, 14]).
	chooseHelper(1, 8, [3]).
	chooseHelper(1, 9, [10]).
	chooseHelper(1, 10, [7]).
	chooseHelper(1, 11, [4]).
	chooseHelper(1, 12 ,[15]).
	chooseHelper(1, 13, [12]).

	chooseHelper(2, 1, [1]).
	chooseHelper(2, 2, [2]).
	chooseHelper(2, 3, [3]).
	chooseHelper(2, 4, [2]).
	chooseHelper(2, 5, [4]).
	chooseHelper(2, 6, [5]).
	chooseHelper(2, 7, [4]).
	chooseHelper(2, 8, [6]).
	chooseHelper(2, 9, [7]).
	chooseHelper(2, 10, [8]).
	chooseHelper(2, 11,[2]).
	chooseHelper(2, 12, [2]).
	chooseHelper(2, 13,[9]).
	chooseHelper(2, 14,[10]).
	chooseHelper(2, 15,[1]).

	chooseHelper(3, 1, [2]).
	chooseHelper(3, 2, [1, 2, 3]).
	chooseHelper(3, 3, [2]).
	chooseHelper(3, 4, [1,2]).
	chooseHelper(3, 5, [1]).
	chooseHelper(3, 6, [2]).
	chooseHelper(3, 7, [2]).
	chooseHelper(3, 8, [1]).
	chooseHelper(3, 9, [1]).
	chooseHelper(3, 10, [3]).
	chooseHelper(3, 11,[1]).
	
	% значения года для условий перехода по правилам
	valuesRuleConditionals(1,1,"1960").
	valuesRuleConditionals(1,2,"1972").
	valuesRuleConditionals(1,3,"1981").
	valuesRuleConditionals(1,4,"1984").
	valuesRuleConditionals(1,5,"1985").
	valuesRuleConditionals(1,6,"1988").
	valuesRuleConditionals(1,7,"1989").
	valuesRuleConditionals(1,8,"1990").
	valuesRuleConditionals(1,9,"1995").
	valuesRuleConditionals(1,10,"1996").
	valuesRuleConditionals(1,11,"1998").
	valuesRuleConditionals(1,12,"2000").
	valuesRuleConditionals(1,13,"2006").
	
	% значения фронтмена для условий перехода по правилам
	valuesRuleConditionals(2,1,"M. Gorshkov").
	valuesRuleConditionals(2,2,"V. Kipelov").
	valuesRuleConditionals(2,3,"Mihalok Minsk").
	valuesRuleConditionals(2,4,"Z. Ramazanova").
	valuesRuleConditionals(2,5,"J. Hetfild").
	valuesRuleConditionals(2,6,"N. Quin").
	valuesRuleConditionals(2,7,"Ch.Benington").
    valuesRuleConditionals(2,8,"J. Lennon").
    valuesRuleConditionals(2,9,"D. Holland").
    valuesRuleConditionals(2,10,"S. Zhukov").
    valuesRuleConditionals(2,11,"A.Grigoriev-Apalonov").
    valuesRuleConditionals(2,12,"A.Pletneva").
    valuesRuleConditionals(2,13,"A.Feltskog").
    valuesRuleConditionals(2,14,"L.Nustrom").
    valuesRuleConditionals(2,15,"T. Dillard").

	% значения города для условий перехода по правилам
	valuesRuleConditionals(3,1,"St. Peterburg").
	valuesRuleConditionals(3,2,"Moscow").
	valuesRuleConditionals(3,3,"Minsk").
	valuesRuleConditionals(3,4,"LA").
	valuesRuleConditionals(3,5,"Limerik").
	valuesRuleConditionals(3,6,"Liverpul").
	valuesRuleConditionals(3,7,"Orange County").
	valuesRuleConditionals(3,8,"Samara").
	valuesRuleConditionals(3,9,"Stokgolm").
	valuesRuleConditionals(3,10,"Kopengagen").
	valuesRuleConditionals(3,11,"Florida").

	% значения количества участников группы для условий перехода по правилам
	valuesRuleConditionals(4,1,"3").
	valuesRuleConditionals(4,2,"4").
	valuesRuleConditionals(4,3,"5").

	% основной предикат определения группы
	rule(0,"Korol i shut1"):-year(6), frontmen(1), foundationCity(1), amount_members(2), conditionals_elements([1,3,5, 10, 11]).
	rule(1,"Korol i shut2"):-year(6), frontmen(1), foundationCity(1), amount_members(2), conditionals_elements([1,3,5, 10, 12]).
	rule(2,"Aria1"):-year(5), frontmen(2), foundationCity(2), amount_members(3), conditionals_elements([1,3,5, 10]).
	rule(22,"Aria2"):-year(5), frontmen(2), foundationCity(2), amount_members(3), conditionals_elements([1,3,5, 11]).
	rule(3,"Lyapis Trubeckoy"):-year(8), frontmen(3), foundationCity(3), amount_members(2), conditionals_elements([1,3,5, 9, 11]).
	rule(4,"Zemfira"):-year(11), frontmen(4), foundationCity(2), amount_members(2), conditionals_elements([1,3,6, 9, 11]).
	rule(5,"Metallica"):-year(3), frontmen(5), foundationCity(4), amount_members(1), conditionals_elements([2, 3, 5, 8, 10]).
	rule(6,"The Cranberries"):-year(7), frontmen(6), foundationCity(5), amount_members(1), conditionals_elements([2,3, 6, 8, 9, 10]).
	rule(7,"Linkin Park"):-year(10), frontmen(7), foundationCity(4), amount_members(2), conditionals_elements([2,3,5, 7, 11]).
	rule(8,"The Beatles"):-year(1), frontmen(8), foundationCity(6), amount_members(2), conditionals_elements([2,3, 5, 9]).
	rule(9,"The offspring"):-year(4), frontmen(9), foundationCity(7), amount_members(2), conditionals_elements([2,3,5, 9, 11]).
	rule(10,"Ruki vverh"):-year(9), frontmen(10), foundationCity(8), amount_members(1), conditionals_elements([1,4,5, 13, 14]).
    rule(11,"Ivanushki Interational"):-year(11), frontmen(7), foundationCity(2), amount_members(1), conditionals_elements([1,4,5, 13, 15]).
	rule(12,"Vintazh"):-year(13), frontmen(12), foundationCity(2), amount_members(1), conditionals_elements([1,4,6, 13, 15]).
	rule(13,"Aqua"):-year(2), frontmen(13), foundationCity(9), amount_members(1), conditionals_elements([2,4,6, 15, 16]).
	rule(14,"ABBA"):-year(7), frontmen(14), foundationCity(10), amount_members(3), conditionals_elements([2,4,6, 13, 14]).
	rule(15,"Florida"):-year(12), frontmen(15), foundationCity(11), amount_members(1), conditionals_elements([2,4,5, 13, 15]).
	
	% условия для перехода "на фактах"
	cond(1,"Russian").
	cond(2,"English").
	cond(3,"Rock").
	cond(4,"Pop").
	cond(5,"Male vocal").
	cond(6,"Female vocal").
	cond(7,"With piano").
	cond(8,"Hard rock").
	cond(9,"Pop rock").
	cond(10,"Metal rock").
	cond(11,"Punk rock").
	cond(12,"Fantasy rock").
	cond(13,"Dancing").
	cond(14,"Lyrics").
	cond(15,"Upbeat rhythms").
	cond(16,"Simple text").

	% проверка на наличие условия в памяти
	year(Choice):-positive(1,Choice).
	frontmen(Choice):-positive(2,Choice).
	foundationCity(Choice):-positive(3,Choice).
	amount_members(Choice):-positive(4,Choice).
	
	% предикаты проверки соотвествия ответов пользователя условиям группы

	conditionals_elements([]).
	% проверка, что все положительные ответы пользователя соотвествуют условиям определения группы
	conditionals_elements([H|T]):- cond(H, _), positive(-1, H), conditionals_elements(T). 
	% при отстуствии корректных положительных ответов пользователя, запрашиваем ответы на вопросы
	conditionals_elements([H|T]):- cond(H, _), getAnswer(H), conditionals_elements(T).   % при отсутствии положительных ответов для условий в памяти, запрашиваем у пользователя
	
	% точка входа в экспертную систему
	expertism():-
		makewindow(1,7,7,"Expert System",0,0,25,80),
		startWork(),
		nl,
		write("Good Bye!!!"),
		nl,clear(),readchar(_),exit.
	
	% основной предикат работы экспертной системы
	startWork():-
		ruleConditionals(Number,Text),
		not(positive(Number,_)),
		write(Text),nl,
		K = Number - 1,
		positive(K, NumberInside),
		chooseHelper(K, NumberInside, VList),
		write("available options "), nl, write(VList), nl,
		show(Number),
		ask(Number),!,
		startWork().
	
	startWork():-rule(R,_),consultt(R).
	startWork():-rule(R,_).
	startWork():-
		write("Sorry... System doesn't have a result for your request"),nl.
	
	% вывод результирующего значения группы
	consultt(R):-
		rule(R,Text),
		write(Text),nl.
	
	%получения ответа пользователя
	getAnswer(CondNumber):-
		not(positive(-1,CondNumber)),
		cond(CondNumber, Text),
		write(Text, " - "), nl, 		
		remember(CondNumber).

	% предикат для запоминания ответов пользователя в памяти
	remember(Number):-
		write("enter 'Yes' (positive conditions) or 'No' (negative conditions) --->"),
		readln(Answer),
		eqstr(Answer),
		asserta(positive(-1,Number)),!.
		
	% предикат проверки положительного ответа
	eqstr("Yes").
	eqstr("Y").
	eqstr("y").
	eqstr("yes").
	
	% предикат вывода вопросов
	show(Number):-
		valuesRuleConditionals(Number,NumberInside,Text),
		write(NumberInside),write(" - "),
		write(Text),nl,fail.

	show(_).
	
	%предикат получения ответов пользователя
	ask(Number):-
		write("Your choice is (number) --->"),
		readint(NumberInside),
		valuesRuleConditionals(Number,NumberInside,_),
		asserta(positive(Number,NumberInside)),!.
	ask(Number):-
		write("Your choice isn't existing"),nl,
		ask(Number).
	
	%очищение ответов пользователя из памяти
	clear():-
		retract(positive(_,_)), fail.
	clear().
	
goal
	expertism().
