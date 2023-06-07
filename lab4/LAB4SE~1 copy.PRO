domains
	list = integer*
database
	positive(integer,integer)
	negative(integer,integer)
predicates
	mandotoryConditions(integer,string)
	pointMandotoryConditions(integer,integer,string)
	rule(integer,string)
	cond(integer,string)
	year(integer)
	creator(integer)
	studio(integer)
	number_of_parts(integer)
	points(list)
	expertism()
	startWork()
	consultt()
	additionalConditions()
	showAdditionalConditions()
	choose()
	remember(integer)
	goOnChoosing()
	eqstr(string)
	show(integer)
	ask(integer)
	clear()
	checkNegative(list)
	notPositiveExisting(list)
	member(integer,list)
clauses
    /*Основные факторы для выбора мультфильма*/
	mandotoryConditions(1,"Year").
	mandotoryConditions(2,"Creator").
	mandotoryConditions(3,"Studio").
	mandotoryConditions(4,"Number of parts").
	
	/*Подфакторыдляосновныхфакторов*/
	pointMandotoryConditions(1,1,"1969").
	pointMandotoryConditions(1,2,"2009").
	pointMandotoryConditions(1,3,"2010").
	pointMandotoryConditions(1,4,"2012").
	pointMandotoryConditions(1,5,"2013").
	pointMandotoryConditions(1,6,"2014").
	pointMandotoryConditions(1,7,"2016").
	
	pointMandotoryConditions(2,1,"Pendleton Ward").
	pointMandotoryConditions(2,2,"Will Carsola").
	pointMandotoryConditions(2,3,"Joe Ruby").
	pointMandotoryConditions(2,4,"Gennady Tartakovsky").
	pointMandotoryConditions(2,5,"Rob Minkoff").
	pointMandotoryConditions(2,6,"Eric Darnell").
	pointMandotoryConditions(2,7,"John Musker").
	
	pointMandotoryConditions(3,1,"Cartoon Network Studios").
	pointMandotoryConditions(3,2,"Warner Bros. Television ").
	pointMandotoryConditions(3,3,"Hanna-Barbera").
	pointMandotoryConditions(3,4,"Columbia Pictures, Sony Pictures").
	pointMandotoryConditions(3,5,"DreamWorks Animation").
	pointMandotoryConditions(3,6,"Walt Disney Pictures").

	pointMandotoryConditions(4,1,"1").
	pointMandotoryConditions(4,2,"2-5").
	pointMandotoryConditions(4,3,"7-12").
	pointMandotoryConditions(4,4,"24").

	/*базаданныхмультфильмов*/
	rule(1,"Mr. Pickles"):-year(5), creator(2), studio(2), number_of_parts(3), points([1,3,4]).
	rule(2,"Scooby Doo"):-year(1), creator(3), studio(3), number_of_parts(4), points([1,3,5,6,7,12]).
	rule(3,"Adventure Time"):-year(3), creator(1), studio(1), number_of_parts(3), points([1,3,6,7,12,13]).
	rule(4,"Hotel Transylvania"):-year(4), creator(4), studio(4), number_of_parts(2), points([2,3,7,12]).
	rule(5," Mr. Peabody & Sherman"):-year(6), creator(5), studio(5), number_of_parts(1), points([2,3,6,8,10,12]).
	rule(6,"Penguins of Madagascar"):-year(6), creator(6), studio(5), number_of_parts(1), points([2,3,6,7,9,12,13]).
	rule(7,"The Princess and the Frog"):-year(2), creator(7), studio(6), number_of_parts(1), points([2,3,6,7,10,11,12]).
	rule(8,"Moana"):-year(2), creator(7), studio(6), number_of_parts(1), points([2,3,6,7,11,12]).
	
	/*Дополнительныефакторы*/
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
	cond(11,"Musical").
	cond(12,"Family").
	cond(13,"Action movie").

	/*Предикат проверяет выбор пользователя по годам*/
	year(Choice):-positive(1,Choice).
	/*Предикат проверяет выбор пользователя по создателю*/
	creator(Choice):-positive(2,Choice).
	/*Выборстудии*/
	studio(Choice):-positive(3,Choice).
	/*Выборколичествачастей*/
	number_of_parts(Choice):-positive(4,Choice).
	
	/*Предикат проверяет, есть ли такие доп. условия, что выбраны с положительным критерием, но их нет в списке доп. условий мультфильма*/
	notPositiveExisting(List): cond(Number,_),positive(0,Number),not(member(Number,List)).

	/*Предикат проверяет элемент на наличия в списке*/
	member(E,[E|_]).
	member(E,[_|Tail]):-member(E,Tail).
	
	/*Предикат проверяет, чтобы условий, которые выбраны с "позитивным" направлением были точно в списке и соответственно с "негативным" не было*/
	points(List):-not(notPositiveExisting(List)),checkNegative(List).

	/*Проверка элемента на "негативное" условие, если условие негативное, а оно есть в списке, то предикат завершает свою работу с отрицательным исходом*/
	checkNegative([]).
	checkNegative([Head|Tail]):-(negative(0,Head)),checkNegative(Tail).
	
	/*Предикат экспертизы, создаёт окно, проводит консультацию и завершает работу*/
	expertism():-makewindow(1,7,7,"Expert System",0,0,25,80),
	startWork(),nl,write("Good Bye!!!"),nl,clear(),readchar(_),exit.
	
	/*Предикат работы, первая альтернатива, берёт основной факт, проверяет был ли ответ на него, если не был, то выводит на экран его варианты, спрашивает пользователя о выборе среди этих условий и рекурсивно запускает этот же предикат. Вторая альтернатива срабатывает, если основных условий свободных уже нет, то мы выясняем, есть ли хотя бы один элемент, который можно будетвывести пользователю на экран, если да, то проводим полную консультацию, после выводим дополнительные условия. Третья альтернатива срабатывает, если не нашлось ни одного объекта для вывода на экран*/
	startWork():-mandotoryConditions(Number,Text),not(positive(Number,_)),write(Text),nl,show(Number),ask(Number),!,startWork().
	startWork():-rule(_,_),consultt(),!,additionalConditions().
	startWork():-not(rule(_,_)),write("Sorry... System doesn't have a result for your request"),nl.
	
	/*Выводэлементовнаэкран*/
	consultt():-rule(_,Text),write(Text),nl,fail.
	consultt().
	
	/*Предикат спрашивает пользователя о том, хочет ли он выбрать доп. условия, в случае положительного ответа происходит вывод вариантов на экран с предложением их выбора и перехода в предикат startwork. При отрицательном ответе срабатывает вторая альтернатива с выходом из рекурсии*/
	additionalConditions():-goOnChoosing(),showAdditionalConditions(),choose(),!,startWork().
	additionalConditions().
	
	/*Вывод доп. условий, тех что ещё не выбраны*/
	showAdditionalConditions():-cond(Number,Text),not(positive(0,Number)),not(negative(0,Number)),write(Number),write(" - "),write(Text),nl,fail.
	showAdditionalConditions().
	
	/*Выбор доп. условий, тех что ещё не выбраны*/
	choose():-write("Your choice is (number) ---> "),readint(Number),cond(Number,_),not(positive(0,Number)),not(negative(0,Numbe)),!,remember(Number).
	choose():-write("Your choice isn't existing or already added, try one more time"),nl,choose().
	
	/*Предикат записи в базу данных ответа в соответствии с ответом пользователя*/
	remember(Number):-write("enter 'Yes' (positive conditions) or 'No' (negative conditions) --->"),readln(Answer),eqstr(Answer),asserta(positive(0,Number)),!.
	remember(Number):-asserta(negative(0,Number)).
	
	/*Вопрособпродолженииконсультации*/
	goOnChoosing():-write("Continue choosing choices? [Input Yes for continue] --->"),readln(Answer),eqstr(Answer).
	
	/*Варианты ответа "да"*/
	eqstr("Yes").
	eqstr("Y").
	eqstr("y").
	eqstr("yes").
	
	/*Выводусловийосновныхфактов*/
	show(Number):-pointMandotoryConditions(Number,NumberInside,Text),write(NumberInside),write(" - "),write(Text),nl,fail.
	show(_).
	
	/*Запрос пользователя, о том какое условие основного факта он хочет выбрать, происходит рекурсивно, пока ответ не будет в диапазоне */
	ask(Number):-write("Your choice is (number) --->"),readint(NumberInside),pointMandotoryConditions(Number,NumberInside,_),asserta(positive(Number,NumberInside)),!.
	ask(Number):-write("Your choice isn't existing"),nl,ask(Number).
	
	/*Очистка базы данных от ответов*/
	clear():-retract(positive(_,_)),fail;retract(negative(_,_)),fail.
	clear().
	
goal
	expertism().
