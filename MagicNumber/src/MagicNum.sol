// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract MagicNum {

    // Deploys a contract that always returns 42
    function deploy() external {
        bytes memory bytecode = hex"";
        address addr;
        assembly {
            // create(value, offset, size)
            addr := create(0, add(bytecode, 0x20), 0x13)
        }
        require(addr != address(0));

    }
}

interface IContract {
    function getMeaningOfLife() external view returns (uint);
}


