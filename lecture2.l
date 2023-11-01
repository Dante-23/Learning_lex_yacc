/* Definition section */
%{
#include <iostream>
using namespace std;
int vowels, consonants;
%}

/* Rules section - pattern and action */
/* Counting number of zeroes and ones */
%%
"ttt" {return 0;}
[ \t\n]+ {return 0;}
[aeiouAEIOU] {vowels++; return 1;}
[^aeiouAEIOU] {consonants++; return 1;}
. ;
%%

int main() {
    cout << "Enter: " << endl;
    while(yylex());
    cout << "vowels: " << vowels << endl;
    cout << "conson: " << consonants << endl;
    return 1;
}

int yywrap() {
    cout << "Done" << endl;
    return 1;
}