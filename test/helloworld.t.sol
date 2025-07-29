// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console, stdError} from "forge-std/Test.sol";
import {helloworld} from "../src/helloworld.sol";

contract helloworldTest is Test {
    helloworld public hello;

    function setUp() public {
        hello = new helloworld();
    }

    function test_GetMessage() public view {
        string memory message = hello.getMessage();
        assertEq(message, "Hello, World from foundry!");
    }

    function test_UpdateMessage() public {
        string memory newMessage = "Hello, Foundry from test!";
        hello.updateMessage(newMessage);
        string memory updatedMessage = hello.getMessage();
        assertEq(updatedMessage, newMessage, "Message should be updated correctly");
    }
}