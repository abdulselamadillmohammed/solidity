// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract SimpleStorage {
    // Basic Types: boolean, uint, int, address, bytes
    // bool hasFavoriteNumber = true;
    // uint256 favoriteNumber = 88;
    // string favoriteNumberInText = "eighty-eight";
    // int256 favoriteInt = -88;
    // address myAddress = ;
    // bytes32 favoriteBytes32 = "cat";
    
    // uint256 internal favoriteNumber = 5; by defult 
    uint256 public myFavoriteNumber = 5;
    uint256 favoriteNumber2;

    //uint256[] listOfFavoriteNumbers; // [0,78,90]

    // typedef struct equivillant 
    struct Person{
        uint256 favoriteNumber;
        string name;
    }

    // sql like declaration
    // Person public pat = Person(7,"Pat"); 
    // Person public pat = Person({favoriteNumber: 7, name: "Pat"}); 

    // Dynamic array 
    Person[] public listOfPeople; // []


    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;   
        // favoriteNumber = favoriteNumber + 1; each operation to perminant storage causes high has costs         
        retrieve(); // Since non view/pure function is calling a view func, then there is still transaction cost 
    }
    // view, pure - keywords were you don't need to perform a transaction
    function retrieve() public view returns (uint256){
        return myFavoriteNumber;
    }

    // We're going to explore calldata, memory, storage 
    function addPerson(string memory name, uint256 _favoriteNumber) public{
        Person memory newPerson = Person(_favoriteNumber, name);
        listOfPeople.push(newPerson);
    }

}

// Basic understanding
/*
The EVM can read and write to several places (easier edition).

Read and Write: 
1. Stack
2. Memory 
3. Storage
4. Calldata 

Write (not read):
1. Logs

Read (not write): 
1. Chain Data

*/