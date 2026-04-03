// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract StudentRegistry {
    struct Student {
        string name;
        uint age;
    }
    Student[] public students;
    function addStudent(string memory name, uint age) public {
        students.push(Student(name, age));
    }
    function getStudent(uint index) public view returns (string memory, uint) {
        Student memory s = students[index];
        return (s.name, s.age);
    }
}
