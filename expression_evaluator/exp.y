%{
#include <stdio.h>
#include <stdlib.h>

extern int yylex();
extern void yyerror(char *msg);
extern void store_identifier(char *id_name, float id_value);
extern float get_identifier_value(char *id_name);
%}

%union {
    float f;
    char id[32];
}

%start S
%token<f> NUM
%token<id> IDENTIFIER
%token PRINT
%type <f> E T F

%%
S   :   IDENTIFIER '=' E ';'             { printf("Printing %s = %f\n", $1, $3); store_identifier($1, $3); }
    |   PRINT E ';'                      { printf("Printing %f\n",$2); }
    |   S IDENTIFIER '=' E ';'           { printf("Printing %s = %f\n", $2, $4); store_identifier($2, $4); }
    |   S PRINT E ';'                    { printf("Printing %f\n",$3); }
    |   IDENTIFIER ';'                   { printf("%s = %f\n", $1, get_identifier_value($1)); }
    |   S IDENTIFIER ';'                 { printf("%s = %f\n", $2, get_identifier_value($2)); }
    ;

E   : T '+' E                          { $$ = $1 + $3; }
    | T '-' E                          { $$ = $1 - $3; }
    | T                                { $$ = $1; }
    ;

T   : F '*' T                          { $$ = $1 * $3; }
    | F '/' T                          { $$ = $1 / $3; }
    | F                                { $$ = $1; }
    ;

F   : '(' E ')'                        { $$ = $2; }
    | '-' F                            { $$ = -$2; }
    | NUM                              { $$ = $1; }
    | IDENTIFIER                       { $$ = get_identifier_value($1); }
    ;

%%

void yyerror(char *msg) {
    fprintf(stderr, "%s\n", msg);
    exit(1);
}