// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./Counter.sol";

contract CounterFactory {
        // deployer of the contract
        address public owner;

    event CounterCreated(address indexed counterAddress);

       // keeping track of Counter created
        Counter[] counterArray;

        constructor() {
        owner = msg.sender;
    }

    function createCounter() external {
        Counter newCounter = new Counter();
        counterArray.push(newCounter);
        emit CounterCreated(address(newCounter));
    }

     function getCounter() public view returns (address) {
        uint256 _allCounter = counterArray.length;
        require(_allCounter > 0, "No Counter has been created");

        Counter lastCounter = counterArray[_allCounter-1];
          return address(lastCounter);
    }
}