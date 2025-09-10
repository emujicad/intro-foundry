# Contrato de Token Dai Bifurcado (forkDai.sol)

Este contrato de Solidity (`forkDai.sol`) sirve como un contrato de marcador de posición o una plantilla para un token que simula el comportamiento del token Dai (DAI), una stablecoin popular. Es particularmente útil en entornos de desarrollo y prueba donde se necesita una versión simulada de Dai sin interactuar con la red principal.

## Características Principales

*   **Nombre del Token**: "Forked Dai Token"
*   **Símbolo del Token**: "fDAI"
*   **Decimales**: 18 (estándar para muchos tokens ERC-20)

## Conceptos de Solidity para Aprender

*   **`pragma solidity ^0.8.24;`**: Define la versión del compilador de Solidity.
*   **`contract forkDai { ... }`**: La estructura básica de un contrato inteligente.
*   **`string public name;`**: Declaración de una variable de estado pública de tipo `string` para el nombre del token.
*   **`string public symbol;`**: Declaración de una variable de estado pública de tipo `string` para el símbolo del token.
*   **`uint8 public decimals;`**: Declaración de una variable de estado pública de tipo `uint8` para el número de decimales del token.
    *   **`uint8`**: Un entero sin signo de 8 bits, suficiente para almacenar un número pequeño como 18.
    *   **Decimales en Tokens**: En Ethereum, los tokens a menudo se dividen en unidades más pequeñas. `decimals` indica cuántas de estas unidades más pequeñas componen una unidad completa del token (por ejemplo, 1 DAI = 10^18 unidades más pequeñas).
*   **Variables de Estado**: Datos que se almacenan permanentemente en la blockchain y son accesibles para lectura desde fuera del contrato debido al modificador `public`.

## Propósito y Uso

Este contrato es una base. Para que funcione como un token ERC-20 completo, necesitaría implementar las funciones estándar de ERC-20, como:

*   `totalSupply()`: Para obtener el suministro total de tokens.
*   `balanceOf(address account)`: Para obtener el saldo de tokens de una dirección específica.
*   `transfer(address recipient, uint256 amount)`: Para enviar tokens a otra dirección.
*   `approve(address spender, uint256 amount)`: Para permitir que otra dirección gaste tokens en su nombre.
*   `transferFrom(address sender, address recipient, uint256 amount)`: Para transferir tokens de una dirección a otra (después de la aprobación).

Este contrato es un excelente punto de partida para entender la estructura básica de un token y cómo se definen sus propiedades fundamentales (nombre, símbolo, decimales) en Solidity. Es un paso inicial para aquellos que desean crear sus propios tokens o interactuar con tokens existentes en la blockchain.

## Cómo Extenderlo

Para convertir este contrato en un token funcional, se recomienda:

1.  **Importar la interfaz ERC-20**: `import "@openzeppelin/contracts/token/ERC20/IERC20.sol";` (o una implementación similar).
2.  **Heredar de una implementación ERC-20**: Por ejemplo, de la biblioteca OpenZeppelin, que proporciona una implementación segura y probada del estándar ERC-20.
3.  **Añadir la lógica de negocio**: Si se necesitan funcionalidades adicionales más allá del estándar ERC-20.

Este contrato es un buen ejemplo de cómo se puede empezar a construir un token en Solidity, centrándose en las propiedades básicas antes de añadir la funcionalidad completa.
