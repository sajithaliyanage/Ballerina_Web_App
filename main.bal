import ballerina.lang.system;

function main (string[] args) {
    system:println("Hello, World!");
    int vart = add(3,5);
    system:println("Add of numvers- "+vart);
}

function add(int x, int y)(int){
    return x+y;
}
