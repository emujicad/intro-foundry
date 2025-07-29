// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

contract ConsoleTest is Test {
    uint256 public number;

    function testLog() public pure{
        int x = -1;
        console.log("Log from test", x); // Note: Only for testing purposes
        console.logInt(x);
    }
}