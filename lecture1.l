/* Definition section. Press CTRL+D for marking end of input. */
%{
#include <iostream>
using namespace std;
%}

/* Rules section - pattern and action */
/* Recognizing capital letters words */
%%
[A-Z]+[ \t\n] {cout << yytext << endl;}
. ;
%%

int main() {
    cout << "Enter: " << endl;
    cout << yylex() << endl;
    return 1;
}

int yywrap() {
    cout << "Done" << endl;
    return 1;
}