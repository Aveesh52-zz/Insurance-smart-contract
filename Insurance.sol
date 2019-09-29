pragma solidity ^0.4.2;

contract Insurance{
    
    address Owner;
    
    struct citizen{
        bool isuidgenerated;
        string name;
        uint amountInsured;
    } 
    
    mapping(address => citizen) public citizenmapping;
    mapping(address => bool) public doctormapping;
    
    constructor() public{
        Owner = msg.sender;
    }
    
    modifier OnlyOwner(){
        require(Owner == msg.sender);
        _;
    }
    
    
    function setDoctor(address _address) public{
        require(!doctormapping[_address]);
        doctormapping[_address] = true;
    }
    
  function setCitizenData(string memory  _name,uint _amountInsured) public returns (address){
       address uniqueId = address(sha256(msg.sender, now));
       citizenmapping[uniqueId].isuidgenerated = true;
       citizenmapping[uniqueId].name = _name;
       citizenmapping[uniqueId].amountInsured = _amountInsured; 
        
        return uniqueId;
   }
    
 function useInsurance(address uniqueId,uint _amountInsured) public returns (string memory){
     require(doctormapping[msg.sender]);
     require(citizenmapping[uniqueId].amountInsured = _amountInsured);
     
     citizenmapping[uniqueId].amountInsured = _amountInsured;
     return "Insurance has been successfully used";
     
     
 }
    }