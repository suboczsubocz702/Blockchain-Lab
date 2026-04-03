// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract BankAnalytics {
    mapping(address => uint) public balances;
    function deposit(uint amount) public {
        balances[msg.sender] += amount;
    }
    function getBalance(address user) public view returns (uint) {
        return balances[user];
    }
    function calculateInterest(uint amount, uint percent) public pure returns (uint) {
        return amount + (amount * percent) / 100;
    }
    function getFutureBalance(address user, uint percent) public view returns (uint) {
        uint balance = getBalance(user); //view
        return calculateInterest(balance, percent); // pure
    }
}

/*
"View functions promise not to modify the state."
mogą czytać stan

"Pure functions promise not to read from or modify the state."
nie czytają ani nie zapisują

"Calling view and pure functions does not cost gas if called externally without a transaction."

Wniosek:
wywołanie z frontendu (eth_call) - 0 gazu
wywołanie w transakcji - koszt gazu

ALE:

jeśli wywołane w transakcji - zużywają gas
*/
