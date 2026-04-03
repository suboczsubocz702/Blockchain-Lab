// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;
/*
    - storage  → trwałe dane w blockchainie
    - memory   → tymczasowe dane (modyfikowalne)
    - calldata → niemodyfikowalne dane wejściowe (najtańsze)

    Jak wynika z dokumentacji:
    "Storage is a reference type... persists between function calls."
    "Memory is temporary and mutable."
    "Calldata is non-modifiable and cheaper than memory."
*/

contract UserRegistry {
        /*Struct przechowywany w storage, bo jest częścią stanu kontraktu*/
    struct User {
        string name;
        uint age;
    }
    /*
        storage:
        - dane trwałe (zapisane na blockchainie)
        - kosztowne operacje (gas)
        - automatycznie używane dla zmiennych stanu
    */
    User[] public users;
    /*
        addUser:
        używamy calldata dla string:
        - calldata jest tylko do odczytu (immutable)
        - nie kopiujemy danych do memory → oszczędność gas

        "Use calldata for external function parameters..."
    */
    function addUser(string calldata name, uint age) public {
        users.push(User(name, age));
    }
    /*
        updateUser:
        używamy memory dla newName:
        - chcemy operować na danych (możliwa modyfikacja)
        - calldata nie pozwala na modyfikację
    */
    function updateUser(uint index, string memory newName) public {
        require(index < users.length, "Niepoprawny indeks");
        users[index].name = newName;
    }
    /*
        getUsers:
        zwracamy tablicę

        "Return variables for complex types must use memory."
    */
    function getUsers() public view returns (User[] memory) {
        return users; // automatyczna kopia storage → memory
    }
    /*
        kopiowanie storage - memory i modyfikacja bez zapisu

        "Assignments between storage and memory always create a copy."
    */
    function getModifiedUser(uint index) public view returns (string memory, uint) {
        require(index < users.length, "Niepoprawny indeks");
        /*
            Tworzymy kopię w memory:
            temp nie wskazuje na storage
            jest niezależną kopią danych
        */
        User memory temp = users[index];
        /*
            Modyfikujemy tylko kopię (memory)
            nie wpływa to na users[index] w storage
        */
        temp.name = string.concat(temp.name, "_temp");
        return (temp.name, temp.age);
    }
}
