// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

type Price is uint256;

contract ProductPrice {
    Price private price;
    function setPrice(uint256 _price) public {
        price = Price.wrap(_price);
    }
    function getPrice() public view returns (uint256) {
        return Price.unwrap(price);
    }
}
