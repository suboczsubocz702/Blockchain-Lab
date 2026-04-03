// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract NameRegistry {

    mapping(address => string) public names;

    function setMyName(string memory name) public {
        names[msg.sender] = name;
    }

    function getMyName() public view returns (string memory) {
        return names[msg.sender];
    }
}
