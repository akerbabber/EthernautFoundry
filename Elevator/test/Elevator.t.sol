// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/AttackerBuilding.sol";

contract ReentranceTest is Test {
    
    address instance = 0xbDeAb98ef022EfE1f29A4A882784E0fb4F4D6205;

    function test() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        AttackerBuilding attacker = new AttackerBuilding();
        attacker.attack(instance);
        vm.stopBroadcast();
    }
}
