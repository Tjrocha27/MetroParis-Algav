/*
Trabalho Realizado pelos alunos:
Tiago Rocha Nº 1101175
João Pinto Nº 1090589
NOTA:
Base de conhecimento não leva espacos no nome das estaçoes nem acentos

*/


/* --- MENU Principal --- */

menu:-  write(' *************** MENU **************** '),nl,
	write(' *                                   * '),nl,
	write(' * 1- Carregar Base de Conhecimento  * '),nl,
	write(' * 2- Horarios                       * '),nl,
	write(' * 3- Calcular o meu Trajeto         * '),nl,
	write(' * 4- Pontos de Interesse Turisticos * '),nl,
	write(' * 5- Planear Visitas                * '),nl,
	write(' * 0- Sair                           * '),nl,
	write(' *                                   * '),nl,
	write(' ************************************* '),nl,
	read(Op),
	exeMenu(Op).

exeMenu(Op):- Op == 1, carregarBase, menu,!;
              Op == 2, horarios,linhaFrequencia ,menu,!;
	      Op == 3, cacularTrajetos, menu,!;
	      Op == 4, pontosInteresse, menu,!;
	      Op == 5, planearVisitas, menu,!;
	      Op == 0, true,!;
	      menu,!.

/* --- Caregar Base de Dados --- */
carregarBase:-	consult('BaseConhecimento.pl').


/* --- Hoarios do metro e afins --- */
horarios:-get_ano(Ano),
	  get_mes(Mes),
	  get_dia(Dia),
	  get_dia_da_semana(DS),
	  write(Dia),write('/'),write(Mes),write('/'),write(Ano),write(', '),write(DS),nl,
	  verificaLinhaAberta(Estado),
	  write('O metro encontra-se: '), write(Estado),nl.

linhaFrequencia:-
	write('Introduza o numero da linha que pretende saber a frequencia'),nl,
	read(Linha),
	linhaFrequencia(Linha).
linhaFrequencia(Linha):-
	get_hora(Hora),
	(Hora > 5, Hora < 9),
	linha(Linha,Lestacoes,[_|HoraPonta]),
	write('A sua linha Nº'), write(Linha), write(', na hora actual, Hora de ponta, é de,'), write(HoraPonta),nl,write('Linha: '),write(Lestacoes).
linhaFrequencia(Linha):-
	linha(Linha,Lestacoes,[HoraNormal|_]),
	write('A sua linha Nº'), write(Linha), write(', na hora actual, Hora de Normal, é de,'), write(HoraNormal),write(' minutos'),nl,write('Linha: '),write(Lestacoes),nl.


/* --- Calcular os diferentes Caminhos --- */
cacularTrajetos:-write(' ******** Calcular o meu Trajeto ******* '),nl,
	         write(' *				       * '),nl,
		 write(' * 1- Menos Trocas                     * '),nl,
		 write(' * 2- Mais Rapido                      * '),nl,
		 write(' * 3- Menor Percurso a Pe              * '),nl,
		 write(' * 0- Menu Anterior                    * '),nl,
		 write(' *				       * '),nl,
		 write(' *************************************** '),nl,
		 read(Op),
		 exeCalc(Op).

exeCalc(Op):- Op == 1, /*menosTrocas,*/ true,!;
              Op == 2, maisRapido ,true,!;
	      Op == 3, /*menorPercursoPe,*/ true,!;
	      Op == 0, true,!;
	      menu,!.


maisRapido:- write('Insira a Sua estação Actual'),nl,
	     read(EA),
	     write('Insira a sua estação Final'),nl,
	     read(EF),
	     caminho_mais_rapido(EA,EF,LR),
	     write('O seu caminho mais rapido é:'),nl,
	     write(LR),nl,nl.



/* --- Pontos de interesse e Visitas --- */

pontosInteresse.

planearVisitas:-write(' ******** Planear Visitas ******* '),nl,
	         write(' *				       * '),nl,
		 write(' * 1- Visitas de meio dia(5 horas)     * '),nl,
		 write(' * 2- Visitas de dia inteiro(8 horas)  * '),nl,
		 write(' * 0- Menu Anterior                    * '),nl,
		 write(' *				       * '),nl,
		 write(' *************************************** '),nl,
		 read(Op),
		 exeVis(Op).

exeVis(Op):-
		Op == 1, visitasMeioDia, true,!;
		Op == 2, visitasDiaInteiro ,true,!;
		Op == 0, true,!;
		menu,!.

		
visitasMeioDia:-
		write('Locais que pretende visitar: '),nl,
		input_to_atom_list(Locais), 
		%read(Locais),
		planoVisitasMeioDia(Locais,Plano),
		write('O Plano é o seguinte:'),nl,
		write(Plano),nl,nl.

input_to_atom_list(L) :-
    read_line_to_codes(user_input, Input),
    string_to_atom(Input,IA),
    tail_not_mark(IA, R, T),
    atomic_list_concat(XL, ',', R),
    maplist(split_atom(' '), XL, S),
    append(S, [T], L).	

is_period(.).
is_period(?).
is_period(!).

split_atom(S, A, L) :- atomic_list_concat(XL, S, A), delete(XL, '', L).

%if tale is ? or ! or . then remove
%A:Atom, R:Removed, T:special mark
tail_not_mark(A, R, T) :- atom_concat(R, T, A), is_period(T),!. 
tail_not_mark(A, R, '') :- A = R.	

visitasDiaInteiro:-
		write('Locais que pretende visitar: '),nl,
		read(Locais),
		planoVisitasDiaInteiro(Locais,Plano),
		write('O Plano é o seguinte:'),nl,
		write('teste'),nl,nl.


/* teste planear visitas
planearVisitas2:-
		open('visitas.txt',write,Stream),
		write(Stream,'teste visitas'), nl(Stream),
		close(Stream).
*/

/* --- Predicados Auxiliares --- */

/* --- Relacionado com datas */
/* --- INICIO --- */
get_ano(Ano):-
	get_time(GT),
	stamp_date_time(GT,Data,'UTC'),
	arg(1,Data,Ano).

get_mes(Mes):-
	get_time(GT),
	stamp_date_time(GT,Data,'UTC'),
	arg(2,Data,Mes).

get_dia(Dia):-
	get_time(GT),
	stamp_date_time(GT,Data,'UTC'),
	arg(3,Data,Dia).

get_hora(Hora):-
	get_time(GT),
	stamp_date_time(GT,Data,'UTC'),
	arg(4,Data,Hora).

get_minutos(Min):-
	get_time(GT),
	stamp_date_time(GT,Data,'UTC'),
	arg(5,Data,Min).

get_dia_da_semana(DiaSemana1):-
	get_ano(Ano),
	get_mes(Mes),
	get_dia(Dia),
	day_of_the_week(date(Ano,Mes,Dia),DiaSemana),
	((DiaSemana == 1;DiaSemana == 2;DiaSemana == 3;DiaSemana == 4;DiaSemana == 5), DiaSemana1 = 'Util';
	DiaSemana == 6, DiaSemana1 = 'Sabado';
	DiaSemana == 7, DiaSemana1 = 'Domingo'),!.

get_dia_da_semana_Num(DiaSemana1):-
	get_ano(Ano),
	get_mes(Mes),
	get_dia(Dia),
	day_of_the_week(date(Ano,Mes,Dia),DiaSemana1).

verificaLinhaAberta(Estado):-
	get_hora(Hora),
	get_minutos(Minutos),
	get_dia_da_semana_Num(DiaSemana),
        ((   DiaSemana > 0, DiaSemana < 5;DiaSemana = 7),
	 (   Hora > 5, Hora =< 23; Hora = 0, Minutos =< 30),
	 Estado = 'Aberto').
verificaLinhaAberta(Estado):-
	get_hora(Hora),
	get_minutos(Minutos),
	get_dia_da_semana_Num(DiaSemana),
	((   DiaSemana > 4, DiaSemana < 7),
	 (   Hora > 5, Hora =< 23; Hora < 2; Hora = 2, Minutos =<30),
	 Estado = 'Aberto').
verificaLinhaAberta(Estado):-
	Estado = 'Fechado'.


verificaFuso(Estado):-
	get_hora(Hora),
	(Hora >= 6 , Hora < 18), Estado = 'Dia',!;
	Estado = 'Noite'.
%



/* --- globais --- */

cria_caminho(_,[],[]).
cria_caminho(Estacoes,[Destino|Destinos],LR):-
	member(Destino,Estacoes),!,
	cria_caminho(Estacoes,Destinos,LR).
cria_caminho(Estacoes,[Destino|Destinos],[[Destino|Estacoes]|LR]):-
	cria_caminho(Estacoes,Destinos,LR).




/* --- 2-Permitir a incorporação do conceito de horário de funcionamento, tempos de viagem entre estações e frequências, que podem variar de acordo com os atributos --- */



/* --- 3-Dada a hora de comparência numa dada estação determinar o trajeto para chegar a outra estação de acordo com diferentes critérios: --- */

/* --- (I)  Menos Trocas ---*/


caminho_menos_trocas(EstacaoInicial,EstacaoFinal,LR):-
	estacao(EstacaoInicial),
	estacao(EstacaoFinal),
	verificaMesmaLinha(EstacaoInicial,NlinhasI),
	verificaMesmaLinha(EstacaoFinal,NlinhasF),
	comparaLinhas(NlinhasI,NlinhasF,Linha),
	imprimeLinha(Linha,EstacaoInicial,EstacaoFinal,LR).


verificaMesmaLinha(EI,Nlinhas):-
	findall(Y,(linha(Y,Estacoes,_), member(EI,Estacoes)),Nlinhas).


comparaLinhas([],[],_):-fail.

comparaLinhas([H|_],NestacoesF,H):-
	member(H,NestacoesF).

comparaLinhas([_|T],NE,_):-
	comparaLinhas(T,NE,_).


imprimeLinha(Linha,EI,EF,LF):-
	linha(Linha,Estacoes,_),
	imprimeLinha1(Estacoes,EI,EF,LF).


imprimeLinha1([H|T],H,EF,[H|T1]):-
	imprimeLinha1(T,H,EF,T1).
/*
imprimeLinha1([H|T],EI,H,[H|T]):-
*/

/* ---- (II) Mais Rápido --- */
caminho_mais_rapido(EstacaoInicial,EstacaoInicial,[EstacaoInicial]).

caminho_mais_rapido(EstacaoInicial,EstacaoFinal,LR):-
	estacao(EstacaoInicial),
	estacao(EstacaoFinal),
	findall(Y,(liga(EstacaoInicial,Y,_);liga(Y,EstacaoInicial,_)),LEstacaoDirectas),
	cria_caminho([EstacaoInicial],LEstacaoDirectas,LC),
	determina_caminho_curto(EstacaoFinal,LC,LR).


determina_caminho_curto(EstacaoDestino,[[EstacaoDestino|L]|_],R):-
	reverse([EstacaoDestino|L],R).

determina_caminho_curto(EstacaoDestino,[[Destino|Destinos]|LR],L):-
	findall(X,(liga(Destino,X,_);liga(X,Destino,_)),LL),
	cria_caminho([Destino|Destinos],LL,Lcaminho),
	append(LR,Lcaminho,Lappend),
	determina_caminho_curto(EstacaoDestino,Lappend,L).

/* --- 4-Permitir a modelação de alguns pontos de interesse turísticos com a indicação de atributos
 como horário de funcionamento (dias e horas), tempo estimado de visita, localização
 (estação ou estações de metro mais próximas) --- */

/* --- 5-Planear visitas de meio dia (5 horas) ou de dia inteiro (8 horas). Recebe a indicação dos
locais que se pretendem visitar e elabora um plano de visita usando o
metro como meio de transporte.--- */

/*
 Recebo a lista de locais com um ou mais locais
 Pego no primeiro local e vejo qual é a estação mais proxima do local
 vou buscar o caminho mais rapido para chegar a esse local
 Listo todas as estaçoes para chegar ao local
 Adiciono tempo que demorou o percuro a uma variavel tempo total
 Verifico se ja passou do limite
 Se ja passou imprimo que o plano é o seguinte
 Senao continuo a procurar na lista e volto a fazer o mesmo
*/

planoVisitasMeioDia(Locais,Plano):-planoVisitasMeioDia(Locais,Locais).

planoVisitasDiaInteiro(Locais,Plano).

/* --- 6-Planear uma visita que começa e acaba no mesmo local usando o metro como meio de transporte
 e que deverá ser exportada para um ficheiro de texto. Este ficheiro deverá conter os trajetos a
 fazer e a estimativa das horas parciais e de termino da visita. Deverão ser fornecidos os locais
 de interesse que se deseja visitar, o local de inicio (que poderá ser um local de interesse ou
 uma estação de metro) e a hora de inicio. --- */
