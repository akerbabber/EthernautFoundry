// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Attacker.sol";

contract ShopTest is Test {
    
    Attacker attacker;
    Shop shop;
    
    function test() public {
        address EOA = vm.rememberKey(vm.envUint("PRIVATE_KEY"));
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        shop = Shop(0x4aFB15373c1c6225363BF709B355a49Fa73eAA2a);
        attacker = new Attacker(payable(address(shop)));
        attacker.attack();
        console2.logUint(shop.price());
        vm.stopBroadcast();
    }
}
