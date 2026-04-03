// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract OrderStatus {
    enum Status { Pending, Shipped, Delivered, Cancelled }
    Status public currentStatus;
    function setShipped() public {
        currentStatus = Status.Shipped;
    }
    function setDelivered() public {
        currentStatus = Status.Delivered;
    }
    function setCancelled() public {
        currentStatus = Status.Cancelled;
    }
    function setPending() public {
        currentStatus = Status.Pending;
    }
}
