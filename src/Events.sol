// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract CEvents {
    event Transfer(address indexed from, address indexed to, uint256 amount); // Event declaration for transfer

    function transferOnce(address _from, address _to, uint256 _amount) public {
        emit Transfer(_from, _to, _amount); // Emitting the Transfer event
    }
    function transferMany(address _from, address[] calldata _to, uint256[] calldata _amounts) public {
        //require(_to.length == _amounts.length, "Mismatched arrays");
        for (uint256 i = 0; i < _to.length; i++) {
            emit Transfer(_from, _to[i], _amounts[i]); // Emitting the Transfer event for each recipient
        }
    }
}
