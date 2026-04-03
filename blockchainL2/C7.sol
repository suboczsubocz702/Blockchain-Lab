// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

type UserId is uint256;

contract UserRegistry {
    mapping(UserId => address) public users;
    function addUser(uint256 _id, address _user) public {
        users[UserId.wrap(_id)] = _user;
    }
    function getUser(uint256 _id) public view returns (address) {
        return users[UserId.wrap(_id)];
    }
}
