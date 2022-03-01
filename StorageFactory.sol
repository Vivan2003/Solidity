// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract StorageFactory is SimpleStorage {

SimpleStorage[] public SimpleStorageArray;

  function CreateSimpleStorageContract() public {
    SimpleStorage simpleStorage = new SimpleStorage();
    SimpleStorageArray.push(simpleStorage);

  }
  function sfStore(uint256 _FavNumberIndex, uint256 _FavNumber) public {
     SimpleStorage simpleStorage = SimpleStorage(address(SimpleStorageArray[_FavNumberIndex]));
     simpleStorage.store(_FavNumber);

  }
   function sfGet(uint256 _FavNumberIndex) public view returns(uint256) {
     SimpleStorage simpleStorage = SimpleStorage(address(SimpleStorageArray[_FavNumberIndex]));
     return simpleStorage.retrieve();
   }

}
