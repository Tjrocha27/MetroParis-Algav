/*
Trabalho Realizado pelos alunos:
Tiago Rocha N� 1101175
Jo�o Pinto N� 1090589

NOTA:
Base de conhecimento n�o leva espacos no nome das esta�oes nem acentos

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
              Op == 2, horarios ,menu,!;
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
	  write(Dia),write('/'),write(Mes),write('/'),write(Ano),write(', '),write(DS),nl,nl.


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


maisRapido:- write('Insira a Sua esta��o Actual'),nl,
	     read(EA),
	     write('Insira a sua esta��o Final'),nl,
	     read(EF),
	     caminho_mais_rapido(EA,EF,LR),
	     write('O seu caminho mais rapido �:'),nl,
	     write(LR),nl,nl.



/* --- Pontos de interesse e Visitas --- */

pontosInteresse.


planearVisitas.


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



/* --- 1- Permitir a modela��o da rede de metro, com indica��o das linhas,
esta��es, cruzamentos e dire��o. --- */

/* Metendo o numero da linha e esta��o final indicara a ordem correcta das linhas */
direcao(Num,EstacaoFim,LF):-
	linha(Num,L),
	direcao1(L,EstacaoFim,LF).

direcao1([H|T],H,LF):-
	reverse([H|T],LF),!.
direcao1(L,_,L).





/* --- 2-Permitir a incorpora��o do conceito de hor�rio de funcionamento, tempos de viagem entre esta��es e frequ�ncias, que podem variar de acordo com os atributos --- */



/* --- 3-Dada a hora de compar�ncia numa dada esta��o determinar o trajeto para chegar a outra esta��o de acordo com diferentes crit�rios:
(II) Mais R�pido --- */

caminho_mais_rapido(EstacaoInicial,EstacaoFinal,LR):-
	estacao(EstacaoInicial),
	estacao(EstacaoFinal),
	findall(Y,(liga(EstacaoInicial,Y,_);liga(Y,EstacaoInicial,_)),LEstacaoDirectas),
	cria_caminho([EstacaoInicial],LEstacaoDirectas,LC),
	determina_caminho_curto(EstacaoFinal,LC,LR).


cria_caminho(_,[],[]).
cria_caminho(Estacoes,[Destino|Destinos],LR):-
	member(Destino,Estacoes),
	cria_caminho(Estacoes,Destinos,LR).
cria_caminho(Estacoes,[Destino|Destinos],[[Destino|Estacoes]|LR]):-
	cria_caminho(Estacoes,Destinos,LR).


determina_caminho_curto(EstacaoDestino,[[EstacaoDestino|L]|_],R):-
	reverse([EstacaoDestino|L],R).

determina_caminho_curto(EstacaoDestino,[[Destino|Destinos]|LR],L):-
	findall(X,(liga(Destino,X,_);liga(X,Destino,_)),LL),
	cria_caminho([Destino|Destinos],LL,Lcaminho),
	append(LR,Lcaminho,Lappend),
	determina_caminho_curto(EstacaoDestino,Lappend,L).

