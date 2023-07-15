ERROR HANDLING IN SOLIDITY

In this Solidity Program we are making a smart contract to demonstrate the use of require() statement, asssert() statement and revert() statements. This smart contract basically tells how we can use these statements to handle the errors in the contract written in Solidity Programming Language.



## Description

The require() statement, assert() statement, and revert() statements are used for the purpose of error handling. The require() statement can be used to validate certain conditions before the function execution proceeds. Basically, it takes two parameters first one will be the condition that needs to be checked and another parameter will be the statement that will be displayed if the condition fails. Hence it checks for the condition and if it fails function execution will be terminated. We can also pass only one parameter as the second one is optional.
The assert() statement is also used for checking errors but it takes only one parameter. The revert() statement is used to flag the error and revert the current call back to the initial state. As in require the second parameter is optional in the same way displaying the message in the revert() statement is optional. This statement can be used to save gas. In this Solidity program, firstly we will use pragma, a compiler directive used for writing the solidity version to be used. After this create and initialize the initial variable to 5 of type unsigned integer. Then create a contract in which we will define three functions. The first function increase will increase the initial by a number to be passed in the function only if the initial is greater than 0. For this, I have used require() statement and passed the second parameter also. The second function decrease will decrease the initial by a number to be passed in the function and use the assert statement to check if the number is less than equal to the initial. The third function revertCheck is used to check the condition if the initial is less than 5 and if it is true then using the revert() statement it will revert back to the initial state.

## Getting Started

### Executing program

To run this contract we need to use Remix IDE which is available at https://remix.ethereum.org/. This Remix IDE will be used to execute smart contracts written in Solidity. After opening the Remix IDE, we need to create a new file and in this case I have named it as error.sol. then copy and paste the code written below:-- // SPDX-License-Identifier: MIT pragma solidity ^0.8.7;

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract errorHandle {

    uint public initial = 5;

    function increase(uint number) public {
        require(number>0,"Number must be greater than 0");
        initial += number;
    }

    function decrease(uint number) public {
        assert(number<=initial);
        initial -= number;
    }

    function revertCheck() public view  {
        if(initial < 5){
        revert("Initial is less than 5");
        }
    }
}

Now to compile the above code click on the "Solidity Compiler" tab in the left-hand sidebar. The compiler option should use the version that is written in the contract. and then click on the "Compile error.sol" button. After this to deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. and then click on deploy button to deploy the contract error.sol. Once the contract has been deployed then we can call the increase and decrease function to add and subtract from the initial. The revert() and assert() statements present in the function will be used to validate the conditions and handle errors. We can call the function revertCheck() and if it is true it will revert back to the initial state. This function uses view as it will only be able to read it can't alter the variables. This is how we will be able to use these statements to handle the errors in the contract.


## Authors

Metacrafter Chris @metacraftersio


## License

This project is licensed under the  MIT License - see the LICENSE.md file for details
