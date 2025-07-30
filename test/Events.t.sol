// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "forge-std/Test.sol"; // Importing the Test library from forge-std
import "../src/Events.sol"; // Importing the Events contract

contract EventsTest is Test {
    CEvents public cevents; // Declare the Errors contract instance

    event Transfer(address indexed from, address indexed to, uint256 amount); // Event declaration for transfer

    function setUp() public {
        cevents = new CEvents(); // Initialize the Events contract
    }

    function testEmitTransferOnce() public {
        address from = address(this); // Using the current contract address as the sender
        address to = address(0x456);
        uint256 amount = 200;

        // Expect the Transfer event to be emitted
        vm.expectEmit(true, true, false, true);
        emit Transfer(from, to, amount);

        // Call the transferOnce function that should emit the event
        cevents.transferOnce(from, to, amount);


        // Verify that the event was emitted correctly
        vm.expectEmit(true, false, false, false); // Expect the Transfer event to be emitted
        emit Transfer(from, to, 400);

        // Call the transferOnce function that should emit the event
        cevents.transferOnce(from, to, 400);
    }

    function testEmitTransferMany() public {
        address from = address(this); // Using the current contract address as the sender
        address[] memory to = new address[](2);
        to[0] = address(0x123);
        to[1] = address(0x456);
        uint256[] memory amounts = new uint256[](2);
        amounts[0] = 150;
        amounts[1] = 250;

        // Expect the Transfer event to be emitted for each recipient
        for (uint256 i = 0; i < to.length; i++) {
            vm.expectEmit(true, true, false, true);
            emit Transfer(from, to[i], amounts[i]); // Emitting the Transfer event for each recipient
        }

        // Call the transferMany function that should emit the events
        cevents.transferMany(from, to, amounts);
    }
}