// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import '../src/IHelloEthernaut.sol';

contract HelloEthernautTest is Test {
   
    function test() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        // get the instance of the contract
        IHelloEthernaut instance = IHelloEthernaut(0x8eF40384cc3878d57896DbbADd21188f9574929C);

        // call the authenticate function with the password
        instance.authenticate(instance.password());

        vm.stopBroadcast();
    }

}
