%{

#include "y.tab.h"
#include <stdio.h>
#include <ctype.h>

%}

%%
\t              { ; }
artista         { return artista; }
nome            { return nome;    }
obras           { return obras;   }
obra            { return obra;   }
eventos         { return eventos; }
ensinou         { return ensino;  }
colaborou       { return colaboracao; }
[A-Za-z0-9]+   { yylval.str = strdup(yytext); return string; }
[{};]           { return yytext[0]; }
.|\n            { ; }

%%
int yywrap() {return 1;}
