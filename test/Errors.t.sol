// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "forge-std/Test.sol"; // Importing the Test library from forge-std
import "../src/Errors.sol"; // Importing the Errors contract

contract ErrorTest is Test {
    CErrors public cerr; // Declare the Errors contract instance

    function setUp() public {
        cerr = new CErrors(); // Initialize the Errors contract
    }

    function test_withoutRevert_ThrowError() public view{
        cerr.throwError(); // Call the function that should revert
    }

    function testRevert_ThrowError() public{
        vm.expectRevert(); // Expect a revert
        cerr.throwError(); // Call the function that should revert.
    }

    function testRevert_RequireMessageThrowError() public{
        vm.expectRevert(bytes("UnAuthorized...!")); // Expect a revert with the message "UnAuthorized"
        cerr.throwError(); // Call the function that should revert.
    }

    function testRevert_ThrowCustomError() public{
        vm.expectRevert(CErrors.UnAuthorized.selector); // Expect a revert with the custom error UnAuthorized
        cerr.throwCustomError(); // Call the function that should revert.
    }

    function testErrorLabel() public pure {
        assertEq(uint256(1), uint256(1), "This is a custom label1 message for assertEq"); // Example of using assertEq with a custom error message
        assertEq(uint256(1), uint256(2), "This is a custom label2 message for assertEq"); // Example of using assertEq with a custom error message
        //vm.expectRevert(CErrors.UnAuthorized.selector); // Expect a revert with the custom error UnAuthorized
        //cerr.throwCustomError(); // Call the function that should revert.
    }  
}