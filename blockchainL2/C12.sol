// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract Marketplace {
    struct Product {
        uint id;
        string name;
        uint price;
        address seller;
    }
    enum ProductStatus { Available, Sold }
    mapping(uint => Product) public products;
    mapping(uint => ProductStatus) public status;
    function addProduct(uint id, string memory name, uint price) public {
        products[id] = Product(id, name, price, msg.sender);
        status[id] = ProductStatus.Available;
    }
    function buy(uint id) public payable {
        require(status[id] == ProductStatus.Available, "Niedostepny");
        require(msg.value == products[id].price, "Zla kwota");
        address seller = products[id].seller;
        status[id] = ProductStatus.Sold;
        payable(seller).transfer(msg.value);
    }
}
