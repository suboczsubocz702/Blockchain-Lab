// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract MinNumber {

    function min(uint a, uint b) public pure returns (uint) {
        if (a < b) {
            return a;
        } else {
            return b;
        }
    }
}
