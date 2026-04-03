// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract UserBalances {

    mapping(address => uint) public balances;

    function deposit(uint amount) public {
        balances[msg.sender] += amount;
    }

    function getMyBalance() public view returns (uint) {
        return balances[msg.sender];
    }
}
