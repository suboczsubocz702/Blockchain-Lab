// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract UserList {
    address[] public users;
    function addUser(address _user) public {
        users.push(_user);
    }
    function userExists(address _user) public view returns (bool) {
        for (uint i = 0; i < users.length; i++) {
            if (users[i] == _user) {
                return true;
            }
        }
        return false;
    }
}
