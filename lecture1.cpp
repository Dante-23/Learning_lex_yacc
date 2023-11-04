int main() {
    // asdad
}

/*
    <tag attr1="value1" attr2="value2"> Text </tag>

body -> tag + body / tag / .
tag -> '<' + tname + ' ' + attr_list + '>' + text + '</' + tname + '>' / .
text -> normal_text + tag
normal_text -> any text / .
tname -> any name
attr_list -> attr_name + '"' + value + '" ' + attr_list / .
attr_name -> any name
value -> any text
*/