// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract FundMe{
 
  mapping (address => uint256) public AddresstoValue;
  function fund() public payable {
     AddresstoValue[msg.sender] += msg.value;

  }



}
