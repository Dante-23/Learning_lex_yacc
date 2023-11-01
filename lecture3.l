/* Definition section */
%{
#include <iostream>
using namespace std;
bool is_comp;
%}

/* Rules section - pattern and action */
/* Recognizing compound and simple statements */
%%
"and" |
"or" |
"but" {is_comp = true;}
. ;
\n {return 0;}
%%

int main() {
    cout << "Enter: " << endl;
    //while(yylex());
    yylex();
    if (is_comp) cout << "Compound" << endl;
    else cout << "Simple" << endl;
    return 1;
}

int yywrap() {
    cout << "Done" << endl;
    return 1;
}