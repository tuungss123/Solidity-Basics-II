// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Ownable{
    address public owner;

    constructor(){
        owner = msg.sender;
    }
    modifier onlyOwner(){
        require(msg.sender == owner, "not owner");
        _;
    }

    function transferOwnership(address newOwner) external onlyOwner{
        require(newOwner != address(0), "Invalid Address");
        owner = newOwner;
    }
}

contract MyContract is Ownable{
    uint256 someValue;
    function setSomeValue(uint256 newValue) external onlyOwner{
        someValue = newValue;
    }
    function getValue() external view onlyOwner returns (uint256){
        return someValue;
    }
}
  