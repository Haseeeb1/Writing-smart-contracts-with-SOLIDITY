//SPDX-License-Identifier: MIT
pragma solidity 0.8.8;

contract SimpleStorage{
    uint256 fav;
    //People public person=People({fav:2,name:"haseeb"});   
    mapping(string=>uint256) public nameToFav;

    struct People{
        uint256 fav1;
        string name;
    }

    People[] public people;
    //people[0]=People({fav:2,name:"haseeb"});

    function store(uint256 _fav) public virtual {
        fav=_fav;
    }
    
    function retreive() public view returns(uint256){
        return fav;
    }
    
    function addPerson(string memory _name,uint256 _fav1) public{
        people.push(People(_fav1,_name));
        nameToFav[_name]=_fav1;
    }
}
