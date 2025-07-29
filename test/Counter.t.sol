// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console, stdError} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);
        assertEq(counter.number(), 0, "Initial number should be 0");
    }

    function test_Increment() public {
        counter.increment();
        assertEq(counter.number(), 1, "Number should be incremented to 1");
    }

    function test_Decrement() public {
        vm.expectRevert(stdError.arithmeticError);
        counter.decrement();
    }

    function testFuzz_SetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x, "Number should be set to the fuzzed value");
    }
}
