// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract SimpleStorage {
         uint256 theNumber;

      struct People {
            uint256 theNumber;
            string name;
      }
     
      People[] public people;
       
       function addPerson(string memory _name , uint256 _theNumber) public{
             people.push(People(_theNumber,_name));
       }


     
     
      function store(uint256 _theNumber) public {
             theNumber = _theNumber;
      }
      
      function retrieve() public view returns(uint256) {
            return theNumber;
      }








}
