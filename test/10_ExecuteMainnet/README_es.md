# Pruebas de Forking de Mainnet (Fork.t.sol)

Este contrato de Solidity (`Fork.t.sol`) demuestra cómo probar contratos inteligentes haciendo un "fork" de la mainnet de Ethereum. El forking de mainnet te permite simular transacciones e interactuar con contratos desplegados como si estuvieras en la red en vivo, pero en un entorno local y controlado. Esta es una técnica de prueba avanzada esencial para desarrollar aplicaciones DeFi complejas o cualquier contrato que interactúe con protocolos existentes.

## Características Principales

*   **Forking de Mainnet**: El entorno de prueba es un fork de la mainnet de Ethereum a una altura de bloque específica.
*   **Interacción con Contratos Desplegados**: Las pruebas muestran cómo interactuar con contratos ya desplegados en mainnet, como WETH.
*   **Verificación de Balances**: Verifica los balances de tokens de cuentas en la cadena forkeada.

## Conceptos de Solidity y Foundry para Aprender

*   **`import {Test, console} from "forge-std/Test.sol";`**: Importa la biblioteca de pruebas estándar de Foundry.
*   **`import {IWETH} from "../../src/10_ExecuteMainnet/interfaces/IWETH.sol";`**: Importa la interfaz para el contrato WETH.
*   **`vm.createSelectFork(forkUrl, blockNumber)`**: Un "cheatcode" que crea y selecciona un fork de una red. `forkUrl` es la URL del endpoint RPC, y `blockNumber` es el bloque desde el que se hará el fork.
*   **`address(this)`**: La dirección del contrato actual.
*   **`deal(address, amount)`**: Un "cheatcode" que establece el balance de una dirección a una cantidad específica.
*   **`interface(address)`**: Crea una instancia de un contrato a partir de una interfaz y una dirección.

## Cómo Funcionan las Pruebas

1.  **`setUp()`**: Esta función se ejecuta antes de cada prueba. Crea un fork de la mainnet de Ethereum utilizando una URL de RPC de Alchemy. También le da 100 ETH al contrato de prueba.
2.  **`test_CheckBalanceWETH()`**: Esta prueba verifica el balance de WETH de una dirección específica en la mainnet forkeada. Demuestra cómo interactuar con un contrato desplegado (WETH) y verificar su estado.

## Uso (Ejecución de Pruebas)

Para ejecutar estas pruebas, necesitarás tener Foundry instalado y una URL de RPC para la mainnet de Ethereum (por ejemplo, de Alchemy o Infura).

```bash
forge test --fork-url <TU_URL_RPC> --match-path test/10_ExecuteMainnet/Fork.t.sol -vvv
```

Reemplaza `<TU_URL_RPC>` con tu URL de RPC real. Ejemplo: forge test --fork-url https://eth-mainnet.g.alchemy.com/v2/rWQAOZwUSF6-eBK-YPy3P --match-path test/ExecuteMainnet/Fork.t.sol -vvv

Este contrato de prueba es un excelente recurso para aprender a probar contratos inteligentes que interactúan con otros protocolos en la mainnet de Ethereum, una habilidad crucial para cualquier desarrollador serio de Web3.
