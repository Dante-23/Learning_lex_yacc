/* Definition section */
%{
#include <iostream>
using namespace std;
bool saw_key, saw_colon;
%}

/* Rules section - pattern and action */
/* Recognizing compound and simple statements */
%%
"</".[a-zA-Z]+.[>] {cout << "Ending tag: " << yytext << endl;}
[<].[a-zA-Z]+ {cout << "Starting tag: " << yytext << endl;}
[a-zA-Z]+.[=] {cout << "Attr: " << yytext << endl;}
["].[a-zA-Z ]+.["] {cout << "Value: " << yytext << endl;}
[>] {cout << "Arrow" << endl;}
. ;
%%

int main() {
    yylex();
}

int yywrap() {
    return 1;
}