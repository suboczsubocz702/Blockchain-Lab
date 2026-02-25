// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract NumberChecker{
    function is0(uint number) external pure returns(bool){
        if (number == 0) {
            return true;
        } else {
            return false;
        }
    }

    function isOdd(uint256 number) external pure returns(bool){
        if (number % 2 == 1) {
            return true;
            } else {
            return false;
        }
    }
    function isEven(uint256 number) external pure returns(bool){
        if (number % 2 == 0) {
            return true;
            } else {
            return false;
        }
   
    }
}
