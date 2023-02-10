// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Order {
    struct OrderDetails {
        uint256 orderId;
        string customerName;
        string productName;
        uint256 quantity;
    }

    mapping(uint256 => OrderDetails) public orders;
    uint256 public orderCount;

    function addOrder(uint256 _orderId, string memory _customerName, string memory _productName, uint256 _quantity) public {
        orders[orderCount] = OrderDetails(_orderId, _customerName, _productName, _quantity);
        orderCount++;
    }

    
    function getOrder(uint256 _orderId) public view returns (uint256, string memory, string memory, uint256) {
        OrderDetails memory order = orders[_orderId];
        return (order.orderId, order.customerName, order.productName, order.quantity);
    }
}

