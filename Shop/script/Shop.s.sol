// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Attacker.sol";

contract ShopScript is Script {
    Attacker attacker;
    Shop shop;

    function run() public {
        address EOA = vm.rememberKey(vm.envUint("PRIVATE_KEY"));
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        shop = Shop(0x4aFB15373c1c6225363BF709B355a49Fa73eAA2a);
        attacker = new Attacker(payable(address(shop)));
        attacker.attack();
    }
}
