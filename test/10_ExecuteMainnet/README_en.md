# Mainnet Forking Tests (Fork.t.sol)

This Solidity contract (`Fork.t.sol`) demonstrates how to test smart contracts by forking the Ethereum mainnet. Mainnet forking allows you to simulate transactions and interact with deployed contracts as if you were on the live network, but in a local, controlled environment. This is an advanced testing technique essential for developing complex DeFi applications or any contract that interacts with existing protocols.

## Key Features

*   **Mainnet Forking**: The test environment is a fork of the Ethereum mainnet at a specific block height.
*   **Interaction with Deployed Contracts**: The tests show how to interact with contracts already deployed on mainnet, such as WETH.
*   **Balance Checks**: Verifies the token balances of accounts on the forked chain.

## Solidity and Foundry Concepts to Learn

*   **`import {Test, console} from "forge-std/Test.sol";`**: Imports Foundry's standard test library.
*   **`import {IWETH} from "../../src/10_ExecuteMainnet/interfaces/IWETH.sol";`**: Imports the interface for the WETH contract.
*   **`vm.createSelectFork(forkUrl, blockNumber)`**: A cheatcode that creates and selects a fork of a network. `forkUrl` is the URL of the RPC endpoint, and `blockNumber` is the block to fork from.
*   **`address(this)`**: The address of the current contract.
*   **`deal(address, amount)`**: A cheatcode that sets the balance of an address to a specific amount.
*   **`interface(address)`**: Creates an instance of a contract from an interface and an address.

## How the Tests Work

1.  **`setUp()`**: This function is executed before each test. It creates a fork of the Ethereum mainnet using an Alchemy RPC URL. It also deals 100 ETH to the test contract.
2.  **`test_CheckBalanceWETH()`**: This test checks the WETH balance of a specific address on the forked mainnet. It demonstrates how to interact with a deployed contract (WETH) and check its state.

## Usage (Running Tests)

To run these tests, you will need to have Foundry installed and an RPC URL for the Ethereum mainnet (e.g., from Alchemy or Infura).

```bash
forge test --fork-url <YOUR_RPC_URL> --match-path test/10_ExecuteMainnet/Fork.t.sol -vvv
```

Replace `<YOUR_RPC_URL>` with your actual RPC URL.  Example: forge test --fork-url https://eth-mainnet.g.alchemy.com/v2/rWQAOZwUSF6-eBK-YPy3P --match-path test/10_ExecuteMainnet/Fork.t.sol -vvv

This test contract is an excellent resource for learning how to test smart contracts that interact with other protocols on the Ethereum mainnet, a crucial skill for any serious Web3 developer.
