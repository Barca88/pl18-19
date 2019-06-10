%{

#define _GNU_SOURCE 
#include <stdlib.h>
#include <stdio.h>

int yyerror (char *s);
int yylex();
int yywrap();
int yyparse();

char* nodo;

%}

/*jj prh*/

%union { char* str; }

%token artista
%token nome
%token obras
%token eventos
%token ensino
%token colaboracao
%token <str> string
%type <str> Artistas Artista Identidade Nome Obras Eventos Relacoes Ensino Colaboracao Elementos

/* operands */
%%

RMvA: Artistas {printf("%s\n",$1);}
    ;

Artistas: Artista {$$ = $1;}
        | Artistas Artista {asprintf(&$$,"%s\n%s",$1,$2);}
        ;

Artista: artista '{' Identidade '}' {$$ = $3;}
       ;

Identidade: Nome {asprintf(&$$,"%s",$1); nodo = strdup($1);}
          | Nome Obras {asprintf(&$$,"%s -> %s",$1,$2);}
          | Nome Obras Eventos {asprintf(&$$,"%s -> %s\n%s -> %s", $1, $2, $1, $3);}
          | Nome Obras Eventos Relacoes {asprintf(&$$,"%s -> %s\n%s -> %s\n%s -> %s", $1, $2,$1, $3, $1, $4);}
          ;

Nome: nome '{' Elementos '}' {$$ = $3;}
    ;

Obras: obras '{' Elementos '}' {$$ = $3;}
     ;

Eventos: eventos '{' Elementos '}' {$$ = $3;}
       ;

Relacoes: Ensino {$$ = $1;}
        | Colaboracao {$$ = $1;}
        ;

Ensino: ensino '{' Elementos '}' {$$ = $3;}
      ;

Colaboracao: colaboracao '{' Elementos'}' {$$ = $3;}
           ;

Elementos: string ';' {asprintf(&$$,"\"%s\"",$1);}
         | Elementos string ';' {asprintf(&$$,"%s -> \"%s\"",$1,$2);}
         ;

%%

#include "lex.yy.c"

int yyerror (char *s) {
   fprintf (stderr, "%s\n",s);
}

int main(){
       printf("digraph g{\n\tratio = fill;\n\tnode [style=filled];\n");
       yyparse();
       printf("}\n");
       return 0;
}