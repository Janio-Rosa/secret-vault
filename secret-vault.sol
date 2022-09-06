// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ownable {
    address owner;
    modifier onlyOwner(){
        require(msg.sender == owner, "must be owner");
        _;
    }
    constructor (){
        owner = msg.sender;
    }
}

contract SecretValut{
    string secret;
    constructor (string memory _secret){
        secret = _secret;
    }
    function getSecret() public view returns(string memory){
        return secret;
    }
}

contract MyInheritanceContract is Ownable {
    address secretVaultAddress;

    constructor (string memory _secret){
        SecretValut _secretValue = new SecretValut(_secret);
        secretVaultAddress = address(_secretValue);
        super;
    }
    function getSecret() public view onlyOwner returns(string memory){
        return SecretValut(secretVaultAddress).getSecret();
    }


}