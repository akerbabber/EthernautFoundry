pragma solidity ^0.8.0;

import "./DexTwo.sol";
import 

contract AttackerToken {
    DexTwo dexTwo;
    
    constructor(address dexTwoAddress) {
        dexTwo = DexTwo(dexTwoAddress);
    }

    
}