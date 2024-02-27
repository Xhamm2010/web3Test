// contracts Counter.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Counter {
    uint256 public count;

    address owner;

    constructor() {
        owner = msg.sender;
    }

    function changeOwner(address _newOwner) public {
        require(msg.sender == owner, "Only owner can interact with this function");
        owner = _newOwner;
    }

    function increment() external {
        count++;
    }

    function decrement() external {
        require(count > 0, "Count cannot go below zero");
        count--;
    }


}