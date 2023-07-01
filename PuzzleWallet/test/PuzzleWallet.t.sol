// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Attacker.sol";

contract PuzzleWalletTest is Test {
    
    Attacker attacker;
    PuzzleWallet shop;
    
    function test() public {
        address proxyAddress = 0x21C5025330E3aB520538Ad83e2fb7e57425557A4;
        address EOA = vm.rememberKey(vm.envUint("PRIVATE_KEY"));
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        PuzzleProxy proxy = PuzzleProxy(proxyAddress);
        console2.log(prox);
        vm.stopBroadcast();
    }
}
