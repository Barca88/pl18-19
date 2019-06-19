%{

#define _GNU_SOURCE 
#include <stdlib.h>
#include <stdio.h>

int yyerror (char *s);
int yylex();
int yywrap();
int yyparse();

char filename[1024];
char* nodo;
FILE* fp;

%}

%union { char* str; }

%token artista
%token nome
%token obras
%token obra
%token eventos
%token ensino
%token colaboracao
%token <str> string
%type <str> Artistas Artista Identidade Nome Obras ListaObras Obra Eventos Relacoes Ensino Colaboracao Elementos

/* operands */
%%

RMvA: Artistas { printf("%s\n",$1); }
    ;

Artistas: Artista { $$ = $1; }
        | Artistas Artista { asprintf(&$$,"%s\n%s",$1,$2); }
        ;

Artista: artista '{' Identidade '}' { $$ = $3; }
       ;

Identidade: Nome { 
                     asprintf(&$$,"\t%s [shape = doublecircle, href=\"file:///home/barca/Projects/pl18-19/Tp3/HTML/%s.html\" ];",$1,$1);
                     sprintf(filename,"HTML/%s.html",$1); 
                     fp = fopen(filename, "w");
                     fprintf(fp,"<h1>%s</h1>",$1);
                     nodo = strdup($1);}
          | Nome Obras { printf("\t%s [shape = doublecircle, href=\"file:///home/barca/Projects/pl18-19/Tp3/HTML/%s.html\"  ];\n",$1,$1);
                     sprintf(filename,"HTML/%s.html",$1);
                     fp = fopen(filename, "w");
                     fprintf(fp,"<h1>%s</h1>",$1);
                     asprintf(&$$,"\t%s -> %s [ label = \"Produziu\", color=\"0.002 0.999 0.999\"];",$1,$2);}
          | Nome Obras Eventos { printf("\t%s [shape = doublecircle, href=\"file:///home/barca/Projects/pl18-19/Tp3/HTML/%s.html\"  ];\n",$1,$1);
                     sprintf(filename,"HTML/%s.html",$1);
                     fp = fopen(filename, "w");
                     fprintf(fp,"<h1>%s</h1>",$1);
                     asprintf(&$$,"\t%s -> %s [ label = \"Produziu\", color=\"0.002 0.999 0.999\"];\n\t%s -> %s [ label = \"Participou\", color=\"0.348 0.839 0.839\" ];", $1, $2, $1, $3);}
          | Nome Obras Eventos Relacoes { printf("\t%s [shape = doublecircle, href=\"file:///home/barca/Projects/pl18-19/Tp3/HTML/%s.html\"  ];\n",$1,$1);
                     sprintf(filename,"HTML/%s.html",$1);
                     fp = fopen(filename, "w");
                     fprintf(fp,"<h1>%s</h1>",$1);
                     asprintf(&$$,"\t%s -> %s [ label = \"Produziu\", color=\"0.002 0.999 0.999\"];\n\t%s -> %s [ label = \"Participou\", color=\"0.348 0.839 0.839\" ];\n\t%s -> %s [ label = \"Relacao\" ];", $1, $2,$1, $3, $1, $4);}
          ;

Obras: obras '{' ListaObras '}' { $$ = $3; }
     ;

ListaObras:  Obra { $$ = $1; }
          |  ListaObras Obra { asprintf(&$$,"%s -> %s",$1,$2); }
          ;

Obra: obra '{' Nome  '}' { $$ = $3; }
    ;

Eventos: eventos '{' Elementos '}' { $$ = $3; }
       ;

Relacoes: Ensino {$$ = $1;}
        | Colaboracao {$$ = $1;}
        | Ensino Colaboracao {$$ = $1;}
        | Colaboracao Ensino {$$ = $1;}
        ;

Ensino: ensino '{' Elementos '}' { $$ = $3; }
      ;

Colaboracao: colaboracao '{' Elementos'}' { $$ = $3; }
           ;

Nome: nome '{' Elementos '}' { $$ = $3;}
    ;


Elementos: string ';' { asprintf(&$$,"\"%s\"",$1); }
         | Elementos string ';' { asprintf(&$$,"%s -> \"%s\"",$1,$2); }
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
       fclose(fp);
       return 0;
}