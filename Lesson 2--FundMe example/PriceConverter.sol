// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter{
    function getPrice() internal view returns (uint) {
        //0x44390589104C9164407A0E0562a9DBe6C24A0E05
        AggregatorV3Interface priceFeed=AggregatorV3Interface(0x44390589104C9164407A0E0562a9DBe6C24A0E05);
        (, int256 price,,,)=priceFeed.latestRoundData();
         return uint(price * 1e10);
    }

    function getVersion() internal view returns (uint256){
       AggregatorV3Interface priceFeed=AggregatorV3Interface(0x44390589104C9164407A0E0562a9DBe6C24A0E05);
       return priceFeed.version();
    }

    function getConversionRate(uint256 ethAmount) internal view returns(uint256){
        uint256 ethPrice=getPrice();
        uint256 ethAmountInUsd=(ethPrice*ethAmount)/1e18;
        return ethAmountInUsd;
    }
}