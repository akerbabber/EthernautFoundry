// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Recovery.sol";

   
contract RecoveryScript is Script {
    address payable constant simpleTokenAddress = payable(0x1447A210d80E1E3D65799EA7DaeBB153B8834Af5);
    function run() external {
        address EOA = vm.rememberKey(vm.envUint("PRIVATE_KEY"));
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        SimpleToken simpleToken = SimpleToken(simpleTokenAddress);
        simpleToken.destroy(payable(EOA));
        vm.stopBroadcast();
    }
}