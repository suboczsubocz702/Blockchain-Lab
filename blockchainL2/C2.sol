// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract NumberList {
    uint[] public numbers;
    function addNumber(uint _number) public {
        numbers.push(_number);
    }
    function getNumber(uint index) public view returns (uint) {
        require(index < numbers.length, "Niepoprawny indeks");
        return numbers[index];
    }
    function getLength() public view returns (uint) {
        return numbers.length;
    }
    function remove(uint index) public {
        require(index < numbers.length, "Niepoprawny indeks");
        numbers[index] = numbers[numbers.length - 1];
        numbers.pop();
    }
}
