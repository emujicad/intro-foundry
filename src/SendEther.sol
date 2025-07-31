// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract SendEther{
    address payable public owner;

    event deposit(address indexed sender, uint256 amount);

    constructor() {
        owner = payable(msg.sender); // Set the contract deployer as the initial owner

    }
    receive() external payable {
        // This function allows the contract to receive Ether
        emit deposit(msg.sender, msg.value); // Emit an event when Ether is received
    }

    function withdraw(uint256 _amount) external {
        require(msg.sender == owner, "Error: Only owner can withdraw. You are not the owner");
        //require(address(this).balance >= _amount, "Insufficient balance");
        //owner.transfer(amount);
        payable(msg.sender).transfer(_amount);
    }

    //function getBalance() external view returns (uint256) {
    //    return address(this).balance;
    //}

    function changeOwner(address _newOwner) external {
        require(msg.sender == owner, "Error: Only owner can change owner");
        owner = payable(_newOwner);
    }
}