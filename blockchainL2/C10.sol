// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;
contract UserSystem {
    struct User {
        uint id;
        address wallet;
        string name;
    }
    mapping(uint => User) public users;
    uint public userCount;
    function addUser(uint id, address wallet, string memory name) public {
        users[id] = User(id, wallet, name);
        userCount++;
    }
    function getUser(uint id) public view returns (User memory) {
        return users[id];
    }
}
