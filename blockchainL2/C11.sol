// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract VotingSystem {
    struct Proposal {
        uint id;
        string description;
        uint voteCount;
    }
    enum VoteStatus { NotVoted, Voted }
    Proposal[] public proposals;
    mapping(address => VoteStatus) public voters;
    function createProposal(string memory description) public {
        proposals.push(Proposal(proposals.length, description, 0));
    }
    function vote(uint proposalId) public {
        require(voters[msg.sender] == VoteStatus.NotVoted, "Juz glosowales");

        proposals[proposalId].voteCount++;
        voters[msg.sender] = VoteStatus.Voted;
    }
}
