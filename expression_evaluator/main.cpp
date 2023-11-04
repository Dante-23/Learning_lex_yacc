#include <iostream>
#include <unordered_map>
using namespace std;

extern int yyparse();

unordered_map<string,float> symbols;

void store_identifier(char *id_name, float id_value) {
    symbols[id_name] = id_value;
}

float get_identifier_value(char *id_name) {
    if (symbols.find(id_name) == symbols.end()) {
        cout << "Symbol not found" << endl;
        return -1;
    }
    return symbols[id_name];
}

int main() {
    cout << "Started" << endl;
    return yyparse();;
}