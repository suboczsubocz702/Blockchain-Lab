// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract SecureVault {
    address public owner;
    mapping(address => uint) public balances;
    error NotOwner();
    error ZeroAmount();
    error InsufficientBalance(uint available, uint required);
    constructor() {
        owner = msg.sender;
    }
    modifier onlyOwner() {
        if (msg.sender != owner) revert NotOwner();
        _;
    }
    modifier nonZeroAmount(uint amount) {
        if (amount == 0) revert ZeroAmount();
        _;
    }
    modifier hasBalance(uint amount) {
        if (balances[msg.sender] < amount) {
            revert InsufficientBalance(balances[msg.sender], amount);
        }
        _;
    }
    function deposit() public payable nonZeroAmount(msg.value) {
        balances[msg.sender] += msg.value;
    }
    function withdraw(uint amount)
        public
        nonZeroAmount(amount)
        hasBalance(amount)
    {
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
    function withdrawAll() public onlyOwner {
        payable(owner).transfer(address(this).balance);
    }
}

/*
"Custom errors are defined using the error keyword."

"Using custom errors is more gas efficient than using require with strings."

Wniosek:
zamiast require("text") -> error + revert
mniej danych zapisanych w bytecode

"Error data is encoded more efficiently than strings."

Wniosek:
string - długi zapis w bytecode
error - tylko selector + dane

"Modifiers can be used to change the behavior of functions in a declarative way."

Wniosek:
pozwalają dodawać warunki przed/po funkcji
redukują powtarzanie kodu

deposit():
nonZeroAmount

withdraw():
nonZeroAmount
hasBalance

withdrawAll():
onlyOwner
*/
