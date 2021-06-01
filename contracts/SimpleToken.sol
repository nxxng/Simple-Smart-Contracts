//SPDX-License-Identifier: MIT

pragma solidity 0.8.0;

contract SimpleToken {
    
    //mapping to return balances given address.
    mapping (address => uint) public balances;
    
    //nested mapping that allows spendable token.
    mapping (address => mapping (address => uint)) public allowance;
    
    //send transaction event
    event Transfer (address indexed from, address indexed to, uint amount);
    
    //spendable approval event
    event approval(address indexed owner, address indexed spender, uint amount);
    
    // token name, supply symbol and decimal information. Changable information anything that want
    uint public totalSupply = 1000;
    string public name = "Simple Token";
    string public symbol = "SMP";
    uint public decimal = 18;
    
    constructor() {
        balances[msg.sender] = totalSupply;
    }
    
    //get the balance of the given address.
    function balanceOf(address owner) public view returns(uint) {
        return balances[owner];
    }
    
    //Send token any address.
    function transfer (address to, uint amount) public returns(bool) {
        require(balances[msg.sender] > 0, "Insufficient Balance!");
        balances[msg.sender] -= amount;
        balances[to] += amount;
        emit Transfer(msg.sender,to,amount);
        return true;
    }
    
    //send token with spendable capability
    function transferFrom(address from, address to, uint amount) public returns(bool) {
        require(balanceOf(from) >= amount, "Insufficient Balance!");
        require(allowance[from][msg.sender] >= amount, "Insufficient Balance of Allowance!");
        balances[from] -= amount;
        balances[to] += amount;
        emit Transfer(from, to, amount);
        return true;
    }
    
    //Function of spendable token approve
    function approve (address spender, uint amount) public returns(bool) {
        allowance[msg.sender][spender] = amount;
        emit approval(msg.sender,spender,amount);
        return true;
    }
    
}