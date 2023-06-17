// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/GatekeeperOne.sol";
import "../src/Attacker.sol";

contract GatekeeperOneScript is Script {
    
    address instance = 0x66f2b971DAB1E06B15b97B7f3b70fB87e8ED074e;

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        Attacker attacker = new Attacker(instance);
        
        vm.stopBroadcast();
    }
}
