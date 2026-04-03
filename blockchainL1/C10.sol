// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract Points {

    uint public points;

    function addPoints(uint _points) public {
        points += _points;
    }

    function getLevel() public view returns (string memory) {
        if (points < 100) {
            return "Niski";
        } else if (points < 500) {
            return "Sredni";
        } else {
            return "Wysoki";
        }
    }
}
