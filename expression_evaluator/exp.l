%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"

%}
%%

"print"                             { return PRINT; }
[a-zA-Z]+			                {strncpy(yylval.id, yytext, 32); return IDENTIFIER;}
[0-9]+(\.[0-9]+)?([eE][0-9]+)?      {yylval.f = atof(yytext); return NUM;}
[-+()*/;=]                            {return yytext[0];}
[ \t\f\v\n]                         { ; }

%%

int yywrap (void) {return 1;}