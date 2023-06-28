// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Attacker.sol";

contract GatekeeperTwoScript is Script {
    address constant gatekeeperAddress = 0x54b2A0FB82B401bed625A9faB12F25896b2b4082;
    function run() external {
        address EOA = vm.rememberKey(vm.envUint("PRIVATE_KEY"));
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        //GatekeeperTwo gatekeeper = new GatekeeperTwo();
        Attacker attacker = new Attacker(address(0x54b2A0FB82B401bed625A9faB12F25896b2b4082));
        vm.stopBroadcast();
    }
}
