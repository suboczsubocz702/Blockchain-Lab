// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

type Points is uint256;

contract LoyaltySystem {
    struct User {
        address wallet;
        Points balance;
    }
    mapping(address => User) public users;
    function register() public {
        users[msg.sender] = User(msg.sender, Points.wrap(0));
    }
    function addPoints(uint amount) public {
        User storage user = users[msg.sender];
        uint current = Points.unwrap(user.balance);
        user.balance = Points.wrap(current + amount);
    }
    function spendPoints(uint amount) public {
        User storage user = users[msg.sender];
        uint current = Points.unwrap(user.balance);
        require(current >= amount, "Za malo punktow");
        user.balance = Points.wrap(current - amount);
    }
}
