// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract CompareNumbers {

    function compare(uint a, uint b) public pure returns (string memory) {
        if (a == b) {
            return "Rowne";
        } else if (a > b) {
            return "A wieksze";
        } else {
            return "B wieksze";
        }
    }
}
