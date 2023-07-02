pragma solidity ^0.6.0;

contract SelfDestructor {
    function destroy(address payable _address) public {
        selfdestruct(_address);
    }
    receive() external payable {
        selfdestruct(msg.sender);
    }
    fallback() external payable {
        selfdestruct(msg.sender);
    }
}