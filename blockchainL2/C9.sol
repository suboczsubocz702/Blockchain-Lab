// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract ProductRegistry {
    struct Product {
        uint id;
        string name;
        uint price;
    }
    mapping(uint => Product) public products;
    function addProduct(uint id, string memory name, uint price) public {
        products[id] = Product(id, name, price);
    }
    function getProduct(uint id) public view returns (Product memory) {
        return products[id];
    }
}
