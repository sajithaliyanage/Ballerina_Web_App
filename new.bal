import ballerina.lang.system;


function main(string[] args){
    any a = 10;
    var intVal= (int)a;
    system:println(intVal + 10);
}
