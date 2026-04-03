// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract UserCounter {

    mapping(address => uint) public interactions;

    function interact() public {
        interactions[msg.sender] += 1;
    }

    function myInteractions() public view returns (uint) {
        return interactions[msg.sender];
    }
}
