// SPDX-License-Identifier: UNLICENSED
pragma solidity <0.7.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import "../src/DoubleEntryPoint.sol";


contract MotorBikeTest is Test {
    address payable doubleEntryPointAddress = 0xd0aa19Dbf38D511fDd8ff6066D872B89573d2fEC;
    
    function test() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        address EOA = vm.rememberKey(vm.envUint("PRIVATE_KEY"));
        
        vm.stopBroadcast();
    }
}
