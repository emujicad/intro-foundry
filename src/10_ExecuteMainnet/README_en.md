# Forked Dai Token Contract (forkDai.sol)

This Solidity contract (`forkDai.sol`) serves as a placeholder contract or a template for a token that simulates the behavior of the Dai (DAI) token, a popular stablecoin. It's particularly useful in development and testing environments where a simulated version of Dai is needed without interacting with the mainnet.

## Key Features

*   **Token Name**: "Forked Dai Token"
*   **Token Symbol**: "fDAI"
*   **Decimals**: 18 (standard for many ERC-20 tokens)

## Solidity Concepts to Learn

*   **`pragma solidity ^0.8.24;`**: Defines the Solidity compiler version.
*   **`contract forkDai { ... }`**: The basic structure of a smart contract.
*   **`string public name;`**: Declaration of a public state variable of type `string` for the token's name.
*   **`string public symbol;`**: Declaration of a public state variable of type `string` for the token's symbol.
*   **`uint8 public decimals;`**: Declaration of a public state variable of type `uint8` for the token's number of decimals.
    *   **`uint8`**: An 8-bit unsigned integer, sufficient for storing a small number like 18.
    *   **Decimals in Tokens**: In Ethereum, tokens are often divisible into smaller units. `decimals` indicates how many of these smaller units make up one full unit of the token (e.g., 1 DAI = 10^18 smallest units).
*   **State Variables**: Data that is permanently stored on the blockchain and is readable from outside the contract due to the `public` modifier.

## Purpose and Usage

This contract is a foundation. To function as a complete ERC-20 token, it would need to implement the standard ERC-20 functions, such as:

*   `totalSupply()`: To get the total supply of tokens.
*   `balanceOf(address account)`: To get the token balance of a specific address.
*   `transfer(address recipient, uint256 amount)`: To send tokens to another address.
*   `approve(address spender, uint256 amount)`: To allow another address to spend tokens on your behalf.
*   `transferFrom(address sender, address recipient, uint256 amount)`: To transfer tokens from one address to another (after approval).

This contract is an excellent starting point for understanding the basic structure of a token and how its fundamental properties (name, symbol, decimals) are defined in Solidity. It's an initial step for those looking to create their own tokens or interact with tokens existing on the blockchain.

## How to Extend It

To turn this contract into a functional token, it is recommended to:

1.  **Import the ERC-20 interface**: `import "@openzeppelin/contracts/token/ERC20/IERC20.sol";` (or a similar implementation).
2.  **Heredar de una implementación ERC-20**: For example, from the OpenZeppelin library, which provides a secure and tested implementation of the ERC-20 standard.
3.  **Add business logic**: If additional functionalities beyond the ERC-20 standard are needed.

This contract is a good example of how to start building a token in Solidity, focusing on the basic properties before adding full functionality.
