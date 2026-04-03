// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract Counter {
    uint public count;
    function increment() public {
        count += 1;
    }
    function decrement() public {
        if (count > 0) {
            count -= 1;
        }
    }
}
