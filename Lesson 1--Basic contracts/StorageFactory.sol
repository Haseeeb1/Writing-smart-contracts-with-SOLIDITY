//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
import "./SimpleStorage.sol";

contract StorageFactory{
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public{
      SimpleStorage simpleStorage= new SimpleStorage();
      simpleStorageArray.push(simpleStorage);
    }

    function sfStore(uint256 _index, uint256 _number) public{
        simpleStorageArray[_index].store(_number);  
    }
    
    function sfGet(uint256 _index) public view returns(uint256){
         return simpleStorageArray[_index].retreive();
    }
}