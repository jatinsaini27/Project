// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract MyToken {
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
