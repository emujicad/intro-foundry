// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract CAuction {
    uint256 public startAuction = block.timestamp + 1 days; // Auction starts in 1 day
    uint256 public endAuction = block.timestamp + 2 days; // Auction lasts for 2 days

    function offer() external view {
        require(block.timestamp >= startAuction && block.timestamp <= endAuction, "You cannot offer now"); // Check if the auction is active
    }

    function finishAuction() external view{
        require(block.timestamp > endAuction, "Auction has not ended yet"); // Logic to end the auction
    }
}