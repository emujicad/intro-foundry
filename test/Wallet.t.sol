// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import "../src/Wallet.sol";

contract WalletTest is Test {
    Wallet public wallet;

    function setUp() public {
        wallet = new Wallet();
    }
    function test_changeOwner() public {
        address newOwner = address(0x00000123);
        console.log("Before become msg.sender address:", msg.sender);
        console.log("Before become - Current wallet.owner address:", wallet.owner());
        wallet.changeOwner(newOwner);
        console.log("After become msg.sender address:", msg.sender);
        console.log("After become - Current wallet.owner address:", wallet.owner());
        assertEq(wallet.owner(), newOwner, "Owner should be updated");
        //assertEq(wallet.owner(), address(0x00000123), "Owner should be updated");
    }
    function test_failNotOwner() public {
        //console.log("Before prank - Current msg.sender address:", msg.sender);
        //console.log("Before prank - Current wallet.owner address:", wallet.owner());
        // Simulate a different address
        vm.prank(address(0x00000124)); // Simulate a different msg.sender address
        //console.log("After prank - Current msg.sender address:", msg.sender);
        //console.log("After prank - Current wallet.owner address:", wallet.owner());
        wallet.changeOwner(address(0x00000124));
        //console.log("After become msg.sender address:", msg.sender);
        //console.log("After become - Current wallet.owner address:", wallet.owner());
    }

//    function test_FailSetOwnerAgain() public {
//        address newOwner = address(0x00000123);
//        wallet.changeOwner(newOwner);
//    }


}
