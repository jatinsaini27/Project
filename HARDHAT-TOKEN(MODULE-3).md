CREATE AND MINT TOKENS ON THE LOCAL HARDHAT NETWORK

In this Solidity Program, we are creating a smart contract in which only the owner will be able to create and mint tokens and any user is able to burn and transfer tokens to a specified address in the Solidity Programming language. Then we have to deploy this smart contract on the local hardhat network (http://127.0.0.1:8545/).
This smart contract is a basic implementation of how to create, mint, burn and transfer tokens.


## Description

In this Solidity Program, firstly we have to use pragma which is a compiler directive that tells us about which solidity version is to be used within the program. Then we create a contract hardhatToken in which we will declare four variables the name of the token, a symbol of the token, the token abbreviation, and the total amount. The first three variables will be declared and it is of string datatype and totalAmount variable will be of an unsigned integer as its value is always greater than 0. We also declare an address variable owner. Then we use a mapping variable which is similar to a dictionary consisting of key-value pair, which maps the address to an unsigned integer. After this we will use a modifier which is a special function that executes certain conditions and if it's found to be true then only the function execution proceeds. we will be using this modifier in the mint function as only the owner will be able to mint the tokens. Then we have a constructor to initialize the state variables of the contract. Then we will declare a function transfer that takes two parameters, the first one will be the address of the receiver to which tokens have to be transferred and the second one is the value that needs to be transferred. In this function we have used require statement to check if the value is less than accountMoney of the sender and if the condition fails then the second parameter of the required statement will be shown. This is required to handle errors and increase the receiver account by that value.
after this, we declare a function burn which takes only one parameter value that needs to be burned and in this also we have used the require statement to check if the value is less than equal to accountMoney and then subtract that value from accountMoney. At last, we will create a mint function which will take two parameters first one address and the second is the value that needs to be added to the account only. In this function, I have used a modifier. After making the contract deploy it on the local hardhat network. ((http://127.0.0.1:8545/).

## Getting Started

### Executing program

To run this contract we need to use Remix IDE which is available at https://remix.ethereum.org/. This Remix IDE will be used to execute smart contracts written in Solidity. After opening the Remix IDE, we need to create a new file and in this case i have named it as Hardhat-token(Module3).sol. then copy and paste the code written below:-- // SPDX-License-Identifier: MIT pragma solidity ^0.8.7;

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract hardhatToken {
    string public name;
    string public symbol;
    string public tokenabbr;
    uint public totalAmount;

    address public owner;

    mapping(address => uint256) public accountMoney;

    modifier onlyOwner() {
        require(msg.sender == owner, "Owner is able to use functions");
        _;
    }

    constructor(string memory _name, string memory _symbol,string memory _abbr, uint256 _totalAmount) {
        name = _name;
        symbol = _symbol;
        tokenabbr = _abbr;
        totalAmount = _totalAmount;
        owner = msg.sender;
       accountMoney[msg.sender] = _totalAmount;
    }

    function transfer(address _reciever, uint256 _value) public {
        require(_value <= accountMoney[msg.sender], "Transaction cannot happen");

       accountMoney[msg.sender] -= _value;
       accountMoney[_reciever] += _value;
    }

    function burn(uint256 _value) public {
        require(_value <= accountMoney[msg.sender], "Not enough for burning token");

        accountMoney[msg.sender] -= _value;
        totalAmount -= _value;
    }

    function mint(address _to, uint256 _value) public onlyOwner {
        
        accountMoney[_to] += _value;
        totalAmount += _value;
    }
}

Now to compile the above code click on the "Solidity Compiler" tab in the left-hand sidebar. The compiler option should use the version that is written in the contract. and then click on the "Compile token.sol" button. After this deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. We have to choose the Dev-Hardhat Provider environment which runs at (http://127.0.0.1:8545/) and then click on the deploy button after assigning the state variables to deploy the contract Hardhat-token(Module3).sol. Once the contract has been deployed then we can call the mint, transfer, and burn function by passing parameters - address and value. We can also call tokenName, tokenAbbreviation, tokenSymbol, and totalSupply to display the characteristics of the token.


## Authors

Metacrafter Chris @metacraftersio


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
