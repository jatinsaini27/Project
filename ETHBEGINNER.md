CREATE A TOKEN

In this Solidity Program we are creating a Contract "myToken" that demonstrates the use of variables, functions , mapping and conditional statements of the Solidity Programming Language.
This smart contract is basic implementation of tokens that how we will be able to mint and burn tokens using functions and also able to store the information like tokenName, totalSupply etc of the token in a variable.


## Description

In this Solidity Program, Firstly we have to use pragma which is the compiler directive and tells about which Solidity version is to be used. Then we will create a contract in which we will define various variables of type string and unsigned integer(unit) to store the information of the token such as tokenName, tokenAbbreviation and totalSupply (unit as it always greater than 0). After this we will use a mapping variable which is similar to a dictionary data type consisting of key value pair. Then i will create a mint function which accepts two paramters address and value that need to be minted into the ethereum address balance and increase the total supply by that value. Then create another function burn which works opposite to mint function by burning the value from the ethereum address balance and decreasing the total supply by that value. Burn function also takes two paramters address and value. In burn function we need to use conditional statements such that values that need to be burn must be less than ethereum address balance. Then we will compile and deploy the contract in Remix IDE.



## Getting Started

### Executing program
To run this contract we need to use Remix IDE which is available at  https://remix.ethereum.org/. This Remix IDE will be used to execute smart contracts written in Solidity.
After opening the Remix IDE, we need to create a new file and in this case i have named it as token.sol.
then copy and paste the code written below:--
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/*
       REQUIREMENTS
    1. Your contract will have public variables that store the details about your coin (Token Name, Token Abbrv., Total Supply)
    2. Your contract will have a mapping of addresses to balances (address => uint)
    3. You will have a mint function that takes two parameters: an address and a value. 
       The function then increases the total supply by that number and increases the balance 
       of the “sender” address by that amount
    4. Your contract will have a burn function, which works the opposite of the mint function, as it will destroy tokens. 
       It will take an address and value just like the mint functions. It will then deduct the value from the total supply 
       and from the balance of the “sender”.
    5. Lastly, your burn function should have conditionals to make sure the balance of "sender" is greater than or equal 
       to the amount that is supposed to be burned.
*/

contract MyToken {

    // public variables here
    string public tokenName = "GANACHE";
    string public tokenAbbreviation = "GAN";
    uint public totalSupply = 0;

    // mapping variable here
    mapping(address => uint ) public balances;

    // mint function
    function mint(address _address,uint _value) public{
        totalSupply += _value;
        balances[_address] += _value;

    }

    // burn function
        function burn(address _address,uint _value) public{
            if(balances[_address]>_value){
        totalSupply -= _value;
        balances[_address] -= _value;
            }

    }

}

Now to compile the above code click on the "Solidity Compiler" tab in the left-hand sidebar. The compiler option should use the version that is written in the contract. and then click on the "Compile token.sol" button.
After this to deploy the contract  by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. and then click on deploy button to deploy the contract token.sol. Once the contract has been deployed then we can call mint and burn function by passing paramters address and value. Then call the balance function to print the balance present at that address. We can also call tokenName, tokenAbbreviation and totalSupply to display the characteristics of token.(In this case i have taken "GANACHE", "GAN" and initializes the token supply to 0)


## Authors

Metacrafter Chris
@metacraftersio


## License

This project is licensed under the  MIT License - see the LICENSE.md file for details
