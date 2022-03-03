// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe{
       address public owner;
       address[] public funders;
      constructor()  {
        owner = msg.sender;
      }
  
  
  
  mapping (address => uint256) public AddresstoValue;
  function fund() public payable {
     uint256 minValue = 50*10*18;
     require(getConversionRate(msg.value) >= minValue, "Fuck you");
     
     AddresstoValue[msg.sender] += msg.value;
     funders.push(msg.sender);
  }
   function getversion() public view returns(uint256) {
     AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
     return priceFeed.version();
   }
  function getPrice() public view returns(uint256) {
    AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
       (,int price,,,) = priceFeed.latestRoundData();
        return uint256(price);
            
    
  }
   function getConversionRate(uint256 ethAmount) public view returns(uint256) {
     uint256 ethPrice = getPrice();
     uint256 EthAmtinUSD = (ethPrice * ethAmount)/ 100000000;
     return EthAmtinUSD;
   }
    modifier theOwner {
      require(msg.sender == owner);
      _;
    }
   
   
   
   function withdraw()  payable theOwner public {
     payable(msg.sender).transfer(address(this).balance);
     for (uint256 funderIndex=0; funderIndex < funders.length;funderIndex++) 
     {
       address funder = funders[funderIndex];
       AddresstoValue[funder]=0;
     }
      funders = new address[](0);
   }


}

