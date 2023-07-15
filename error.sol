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
