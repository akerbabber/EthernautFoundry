 

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import '../src/CoinFlip.sol';
import '../src/Attacker.sol';

contract CoinFlipScript is Script {
   
    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        // get the instance of the contract
        CoinFlip instance = CoinFlip(0x7D69D27Da092c5A2A5aBB5F6025d9B9bDb938418);

        // deploy the attacker
        Attacker attacker = Attacker(0xc4210e03A16Ce0E6deD83658e7fa7D33C40320C9);

        // if already deployed
        //Attacker attacker = Attacker(0x5a260D0Bedd155AC380a70Ca0647dE588E43D350);

        // Calling the flip function using an attacker contract to only get right guesses
  
            attacker.hack();
            console.log("Consecutive Wins: ", instance.consecutiveWins());

        vm.stopBroadcast();
    }

}
