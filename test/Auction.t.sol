// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "forge-std/Test.sol"; // Importing the Test library from forge-std
import "../src/Auction.sol"; // Importing the Events contract

contract AuctionTest is Test {
    CAuction public cAuction; // Declare the Auction contract instance

    uint256 private start;
    uint256 private end;

    // Setting up the Auction contract before each test
    // This function is called before each test function
    // It initializes the CAuction contract instance
    // and sets the start and end times for the auction
    // The auction starts in 1 day and lasts for 3 days
    // The start time is set to the current block timestamp plus 1 day
    // The end time is set to the start time plus 3 days
    // This ensures that the auction is ready for testing
    // The start and end times are used to verify the auction's state
    // during the tests, ensuring that the auction logic is functioning correctly.
    // The startAuction variable is set to the current block timestamp plus 1 day
    // The endAuction variable is set to the startAuction plus 2 days  
    function setUp() public {
        cAuction = new CAuction(); // Initialize the Auction contract
        start = block.timestamp + 1 days; // Auction starts now
        end = block.timestamp + 2 days; // Auction lasts for 2 days
    }

    function testOfferBeforeAuctionStarts() public {
        //vm.warp(cAuction.startAuction() - 1); // Warp to before the auction starts
        vm.expectRevert("You cannot offer now"); // Expect revert with specific message
        cAuction.offer(); // Call the offer function
    }

    function testOffer() public {
        vm.warp(start + 1 days); // Warp to after the auction starts
        cAuction.offer(); // Call the offer function
        // No revert expected, so the test passes if no revert occurs
    }

    function testOfferfailAfterAuctionEnds() public {
        vm.warp(start + 3 days); // Warp to after the auction ends
        vm.expectRevert("You cannot offer now"); // Expect revert with specific message
        cAuction.offer(); // Call the offer function
    }

    function testTimestamp() public {
        uint t = block.timestamp; // Get the current block timestamp
        skip(100); // Skip 100 seconds
        assertEq(t + 100, block.timestamp); // Assert that the timestamp is equal to the current block
    
        rewind(10); // Rewind 10 seconds
        assertEq(t + 90, block.timestamp); // Assert that the timestamp is equal to the current block
    }

    function testBlockNumber() public {
        uint b = block.number; // Get the current block number
        vm.roll(255); // Roll the block number to 255
        assertEq(block.number,255); // Assert that the block number is equal to 255
        vm.roll(b); // Roll back to the original block number
        assertEq(b, block.number); // Assert that the block number is equal to the original block number
    }
}