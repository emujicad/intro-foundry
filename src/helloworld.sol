// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract helloworld {
    string private message;

    constructor() {
        message = "Hello, World from foundry!";
    }

    function getMessage() public view returns (string memory) {
        return message;
    }

    function updateMessage(string memory _newMessage) public {
        message = _newMessage;
    }
}
