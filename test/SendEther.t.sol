// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import "../src/SendEther.sol";

contract SendEtherTest is Test {
    SendEther public sendEther; // Declare the SendEther contract instance

    function setUp() public {
        sendEther = new SendEther();
    }

    function _send(uint256 amount) private {
        require(amount > 0, "Amount must be greater than zero");
        require(address(this).balance >= amount, "Insufficient balance in test contract");
        // Send ether to the SendEther contract
        (bool success, ) = address(sendEther).call{value: amount}(""); // Send ether to the SendEther contract
        require(success, "Failed to send Ether");
    }

    function testEtherBalance() public view {
        console.log("Current this.balance:", address(this).balance/1e18, "ETH");
        console.log("Current sendEther.balance:", address(sendEther).balance/1e18, "ETH");
    }
    function testSendEther() public {
        uint256 initialBalance = address(this).balance;
        console.log("Before sendEther.owner address:", sendEther.owner());
        console.log("Before this.balance:", address(this).balance/1e18, "ETH");
        console.log("Before sendEther.balance:", address(sendEther).balance/1e18, "ETH");
        uint256 amount = 1 ether; // Define the amount to send
        _send(amount); // Send ether to the SendEther contract
        console.log("After sendEther.owner address:", sendEther.owner());
        console.log("After this.balance:", address(this).balance/1e18, "ETH");
        console.log("After sendEther.balance:", address(sendEther).balance/1e18, "ETH");
        // Check the balance of the SendEther contract
        assertEq(address(sendEther).balance, amount, "SendEther contract should have the sent amount");
        // Check the balance of the test contract
        assertEq(address(this).balance, initialBalance - amount, "Test contract should have reduced balance"); 
    }

    function testSendEther2() public {

        uint256 initialBalance = address(sendEther).balance;

        deal(address(1), 10 ether); // Give the test contract 10 ether
        assertEq(address(1).balance, 10 ether, "Address 1 should have 10 ether");

        deal(address(1), 145 ether); // Give the test contract 145 ether
        vm.prank(address(1)); // Set the sender to address(1)
        _send(145); // Send ether to the SendEther contract

        hoax(address(1), 345 ether); // Simulate a transaction from address(1) with 145 ether
        _send(345); // Send ether to the SendEther contract

        assertEq(address(sendEther).balance, initialBalance +145 + 345, "SendEther contract should have 490 ether");
    }
}
