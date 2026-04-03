// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract SimpleVoting {

    mapping(address => bool) public hasVoted;
    uint public votes;

    function vote() public {
        require(!hasVoted[msg.sender], "Juz glosowales");
        hasVoted[msg.sender] = true;
        votes += 1;
    }
}
