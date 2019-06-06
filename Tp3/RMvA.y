%{

#include <stdio.h>
#include <ctype.h>

%}

/*jj*/
%token artista
%token nome
%token obra
%token evento
%token ensinados
%token elemento


%%
/* operands */
%token <string> RMvA Artistas Artista Nome Obras Obra Eventos Evento Elementos Elemento


%%

RMvA: Artistas
    ;

Artistas: Artista;
        | Artistas Artista
        ;

Artista: artista '<' Nome Obras Eventos Ensinados '>'
       ;

Nome: nome '<' Elementos '>'
    ;

Obras: Obra;
     | Obras Obra
     ;

Obra: obra '<' Elementos '>';
    ;

Eventos: Evento
       | Eventos Evento;
       ;

Evento: evento '<' Elementos '>';
      ;

Elementos: Elemento;
         | Elementos Elemento
         ;   

Elemento: elemento ';'
        ;

%%
