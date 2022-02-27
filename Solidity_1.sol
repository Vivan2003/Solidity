pragma solidity ^0.8.0;

contract SimpleStorage {
          
         // this will get initialized to 0!
        uint256  favouriteNumber;

        function store(uint256 _favouriteNumber) public {
              favouriteNumber = _favouriteNumber;
              uint256 test = 4;
        }
        
        // view, pure (blue functions are view functions)
        function retrieve() public view returns(uint256) {
              return favouriteNumber;
            
         }
        
}


