%{

#include "y.tab.h"
#include "lex.yy.c"
#include <stdio.h>

%}

SPACE " "*
%option noyywrap
%%
artista         { return artista; }
nome            { return nome; }
obra            { return obra; }
evento          { return evento; }
ensinou         { return ensinados; }
[a-zA-Z0-9]     { return elemento; }


[=+/*()\-;%:<>] { return yytext[0]; }
[0-9]+        { return NUM; }



