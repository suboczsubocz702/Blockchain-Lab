// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract LimitedWithdraw {

    mapping(address => uint) public balances;

    function deposit(uint amount) public {
        balances[msg.sender] += amount;
    }

    function withdraw(uint amount) public {
        require(balances[msg.sender] >= amount, "Za malo srodkow");
        balances[msg.sender] -= amount;
    }
}
