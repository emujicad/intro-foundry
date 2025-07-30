// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract CErrors {
    error UnAuthorized(); // Custom error for unauthorized access

    function throwError() external pure{
        require(false, "UnAuthorized...!"); // This will revert with the string "UnAuthorized"
    }
    function throwCustomError() public pure{
        revert UnAuthorized(); // Using the custom error directly
    }
}