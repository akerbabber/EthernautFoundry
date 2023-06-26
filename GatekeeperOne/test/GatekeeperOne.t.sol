// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/GatekeeperOne.sol";
import "../src/Attacker.sol";
//51807
//51638
contract GatekeeperOneTest is Test {
    address constant gatekeeperAddress = 0x66f2b971DAB1E06B15b97B7f3b70fB87e8ED074e;

    event Log(uint gas, string msg);
    function test() external {
        address EOA = vm.rememberKey(vm.envUint("PRIVATE_KEY"));
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        GatekeeperOne gatekeeper = new GatekeeperOne();
        Attacker attacker = new Attacker(address(gatekeeper));
        //console.log(uint32(uint64(key)));
        //console.log(uint16(uint64(key)));
        //console.log(uint16(uint160(tx.origin)));
        bytes8 addrKey = bytes8(uint64(uint160(tx.origin)));
        //console.logBytes8(addrKey);
        addrKey = addrKey << 48;
        addrKey = addrKey >> 48;
        addrKey = bytes8(uint64(addrKey) + 2 ** 32);
        //console.logBytes8(addrKey);
        console2.logBytes8(addrKey);
        tryKey(addrKey);

        //for (uint i = 0; i < 100000; i++) {
        //   try attacker.attack{gas: i + (8191)}(addrKey) { 
        //    console.log("Success");
        //    console.log(i);
        //   } catch {
        //    //console.log("Fail");
        //   }
        //    
        //}
        vm.stopBroadcast();
    }
    function tryKey(bytes8 _gateKey) public {
        require(uint32(uint64(_gateKey)) == uint16(uint64(_gateKey)), "GatekeeperOne: invalid gateThree part one");
        require(uint32(uint64(_gateKey)) != uint64(_gateKey), "GatekeeperOne: invalid gateThree part two");
        require(uint32(uint64(_gateKey)) == uint16(uint160(tx.origin)), "GatekeeperOne: invalid gateThree part three");
        //console2.log(tx.origin);
    }
}
