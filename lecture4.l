/* Definition section */
%{
#include <iostream>
using namespace std;
bool saw_key, saw_colon;
%}

/* Rules section - pattern and action */
/* Recognizing compound and simple statements */
%%
db_.* {
        cout << "Key: " << yytext << endl;
        saw_key = true;
    }
[ ]+:[ ]+ { 
        if (!saw_key) {}
        else {
            cout << "Found colon" << endl;
            saw_colon = true;
        }
    }

. ;
%%

int main() {
    cout << "Enter: " << endl;
    //while(yylex());
    yylex();
    return 1;
}

int yywrap() {
    cout << "Done" << endl;
    return 1;
}