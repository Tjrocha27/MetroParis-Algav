/*
Trabalho Realizado pelos alunos:
Tiago Rocha N� 1101175
Jo�o Pinto N� 1090589

NOTA:
Base de conhecimento n�o leva espacos no nome das esta�oes nem acentos


*/
/* --- Base de Conhecimento --- */

/* --- ESTA�OES EXISTENTES --- */


/* --- Esta��es da linha 1 --- */

estacao(la_defense).
estacao(esplanade_de_la_defense).
estacao(pont_de_neuilly).
estacao(les_sablons).
estacao(porte_maillot).
estacao(argentine).
estacao(charles_de_gaulle-etoile).
estacao(george_v).
estacao(franklin_d_roosevelt).
estacao(champs-elysees-clemenceau).
estacao(concorde).
estacao(tuileries).
estacao(palais_royal_musee_du_louvre).
estacao(louvre_rivoli).
estacao(chatelet).
estacao(hotel_de_ville).
estacao(saint_paul).
estacao(bastille).
estacao(gare_de_lyon).
estacao(reuilly_diderot).
estacao(nation).
estacao(porte_de_vincennes).
estacao(saint_mande).
estacao(berault).
estacao(chateau_de_vincennes).

/*  --- Esta�oes da linha 2 --- */
estacao(porte_dauphine).
estacao(victor_hugo).
% estacao(charles_de_gaulle-etoile). J� existe na linha 1,6 (Cruzamento)
estacao(ternes).
estacao(courcelles).
estacao(monceau).
estacao(villiers).	% existe na linha 3
estacao(rome).
estacao(place_de_clichy).	% existe na linha 13
estacao(blanche).
estacao(pigalle).	% existe na linha 12
estacao(anvers).
estacao(barbes_rochechouart).	% existe na linha 4
estacao(la_chapelle).
estacao(stalingrad).	% existe na linha 5,7
estacao(jaures).		% existe na linha 5,7
estacao(colonel_fabien).
estacao(belleville).	% existe na linha 11
estacao(couronnes).
estacao(menilmontant).
estacao(pere_lachaise).	% existe na linha 3
estacao(philippe_auguste).
estacao(alexandre_dumas).
estacao(avron).
% estacao(nation).	 J� existe na linha 1,6,9 (Cruzamento)

/* --- Esta�oes da linha 3 --- */

estacao(pont_de_levallois_becon).
estacao(anatole_france).
estacao(louise_michel).
estacao(porte_de_champerret).
estacao(pereire).
estacao(wagram).
estacao(malesherbes).
% estacao(villiers). J� existe na linha 2 (Cruzamento)
estacao(europe).
estacao(saint_lazare). % existe na linha 12,13,14
estacao(havre_caumartin). % existe na linha 9
estacao(opera). % existe na linha 7,8
estacao(quatre_septembre).
estacao(bourse).
estacao(sentier).
estacao(reaumur_sebastopol). % existe na linha 4
estacao(arts_et_metiers). % existe na linha 11
estacao(temple).
estacao(republique). % existe na linha 5,8,9,11
estacao(parmentier).
estacao(rue_saint_maur).
estacao(pere_lachaise). % existe na linha 2
estacao(gambetta). % existe na linha 3
estacao(porte_de_bagnolet). % existe na linha 3
estacao(gallieni).

/* --- Esta�oes da linha 3 bis --- */

/* --- Esta�oes da linha 4 --- */

estacao(porte_de_clignancourt).
estacao(simplon).
estacao(marcadet_poissonniers). % existe na linha 12
estacao(chateau_rouge).
% estacao(barbes_rochechouart). J� existe na linha 2 (Cruzamento)
estacao(gare_du_nord).  % existe na linha 5
estacao(gare_de_lest). % existe na linha 5,7
estacao(chateau_deau).
estacao(strasbourg_saint_denis). % existe na linha 8,9
% estacao(reaumur_sebastopol). J� existe na linha 3 (Cruzamento)
estacao(etienne_marcel).
estacao(les_halles).
% estacao(chatelet). J� existe na linha 1,7,11,14 (Cruzamento)
estacao(cite).
estacao(saint_michel).
estacao(odeon). % existe na linha 10
estacao(saint_germain_des_pres).
estacao(saint_sulpice).
estacao(saint_placide).
estacao(montparnasse_bienvenue). % existe na linha 6,12,13
estacao(vavin).
estacao(raspail). % existe na linha 6
estacao(denfert_rochereau). % existe na linha 6
estacao(mouton_duvernet).
estacao(alesia).
estacao(porte_dorleans).
estacao(mairie_de_montrouge).

/* --- Esta�oes da linha 5 --- */

estacao(bobigny_pablo_picasso).
estacao(bobigny_pantin_raymon_queneau).
estacao(eglise_de_pantin).
estacao(hoche).
estacao(porte_de_pantin).
estacao(ourcq).
estacao(laumiere).
% estacao(jaures). J� existe na linha 2 (Cruzamento)
% estacao(stalingrad). J� existe na linha 2,7 (Cruzamento)
% estacao(gare_du_nord). J� existe na linha 4 (Cruzamento)
% estacao(gare_de_l'est). J� existe na linha 4,7 (Cruzamento)
estacao(jacques_bonsergent).
% estacao(republique). J� existe na linha 3,8,9,11 (Cruzamento)
estacao(oberkampf). % existe na linha 9
estacao(richard_lenoir).
estacao(breguet_sabin).
% estacao(bastille).  J� existe na linha 1,8 (Cruzamento)
estacao(quai_de_la_rapee).
estacao(gare_dausterlitz). % existe na linha 10
estacao(saint_marcel).
estacao(campo_formio).
estacao(place_ditalie). % existe na linha 6,7

/* --- Esta�oes da linha 6 --- */

% estacao(charles_de_gaulle-etoile). J� existe na linha 1,2 (Cruzamento)
estacao(kleber).
estacao(boissiere).
estacao(trocadero).


/* --- Esta�oes da linha 7 --- */



/* --- Esta�oes da linha 9 --- */



/* --- Esta�oes da linha 10 --- */



/* --- Esta�oes da linha 11--- */



/* --- Esta�oes da linha 12 --- */



/* --- Esta�oes da linha 13 --- */



/* --- Esta�oes da linha 14 --- */



/* --- LIGA�OES DIRETAS DAS LINHAS  --- */

/* linha 1 */
liga(la_defense,esplanade_de_la_defense).

liga(esplanade_de_la_defense,pont_de_neuilly).

liga(pont_de_neuilly,les_sablons).

liga(les_sablons,neuilly_pte_maillot).

liga(neuilly_pte_maillot,charles_de_gaulle-etoile).

/* linha 2 */

liga(porte_dauphine,victor_hugo).

liga(victor_hugo,charles_de_gaulle-etoile).

/* linha 3 */

/* linha 4 */

/* linha 5 */

/* linha 6 */
liga(charles_de_gaulle-etoile,kleber).
liga(kleber,charles_de_gaulle-etoile).

liga(kleber,boissiere).
liga(boissiere,kleber).

liga(boissiere, trocadero).
liga(trocadero, boissiere).
/* linha 7 */

/* linha 8 */

/* linha 9 */

/* linha 10 */

/* linha 11 */

/* linha 12 */

/* linha 13 */

/* linha 14 */


/* Linhas completas  */

linha(1,[la_defense,esplanade_de_la_defense,pont_de_neuilly,les_sablons,neuilly_pte_maillot,charles_de_gaulle-etoile]).

linha(2,[porte_dauphine,victor_hugo,charles_de_gaulle-etoile]).

linha(6,[charles_de_gaulle-etoile,kleber,boissiere,trocadero]).



/* linhas teste */

liga(pont_de_neuilly,porte_dauphine ).

liga(victor_hugo,boissiere).

/* --- 1- Permitir	a modela��o da rede de metro, com indica��o das linhas,
esta��es, cruzamentos e dire��o. --- */






























