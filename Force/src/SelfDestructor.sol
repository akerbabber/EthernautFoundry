// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract SelfDestructor {
    address public owner;


    function destroy(address target) public {
        selfdestruct(payable(target));
    }

    receive() external payable {
    }
}