#ifndef __MAIN__
#define __MAIN__ 1

#define TOKEN_NUM       1
#define TOKEN_OP         2
#define TOKEN_IDENTIFIER 4


/*
token TOKEN_NUM
token TOKEN_IDENTIFIER

    assignment   : TOKEN_IDENTIFIER = expr                { $1 = $3; }
    expr  : expr1 '+' expr      { $$ = $1 + $3; }
          | expr1 '-' expr      { $$ = $1 - $3; }
          | expr1               { $$ = $1; }
    expr1 : expr2 '*' expr1     { $$ = $1 * $3; }
          | expr2 '/' expr1     { $$ = $1 / $3; }
          | expr2               { $$ = $1; }
    expr2 : TOKEN_NUM                 { $$ = $1; }
          | TOKEN_IDENTIFIER          { $$ = value_of($1); }

    TOKEN_OP
    TOKEN_IDENTIFIER

    a = 9 + 10
*/

#endif