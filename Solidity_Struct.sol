// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract SimpleStorage {

        uint256  public myNumber;

        struct People {
            uint256 myNumber;
            string name;
        }
         
         People public person = People ({myNumber: 2,name: "John"});

        



      function store(uint256 _myNumber) public{
            myNumber = _myNumber;
      }
      function retrieve() public view returns(uint256) {
            return myNumber;
      }


}

