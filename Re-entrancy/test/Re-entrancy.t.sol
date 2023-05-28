// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "../src/King.sol";
import "../src/Attacker.sol";

contract KingTest is Test {
    
    address instance = 0xAC10925ca9460894cFEC04eE67Cc0E351762C5aB;

    function test() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        Attacker attacker = new Attacker();
        attacker.attack{value: 0.001 ether}();
        vm.stopBroadcast();
    }
}
