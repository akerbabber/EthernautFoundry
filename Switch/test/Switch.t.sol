// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Switch.sol";

contract SwitchTest is Test {
    
    Switch instance = Switch(0x6155A4e1E4fA340AfaaCcff3342F822CC9E631d2);
    
    function test() public {
        address EOA = vm.rememberKey(vm.envUint("PRIVATE_KEY"));
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        console2.logBytes4(instance.offSelector());
        bytes memory data = abi.encodeCall(Switch.turnSwitchOff, ());
        console2.logBytes(data);
        instance.flipSwitch(data);
        console2.log(instance.switchOn());
        vm.stopBroadcast();
    }
}
