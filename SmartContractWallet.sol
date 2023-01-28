// SPDX-License-Identifier: MIT

pragma solidity 0.8.16;

contract SmartContractWallet {


    // Wallet has one owner
    address payable owner;

    constructor() {
        owner = payable(msg.sender);
    }

    // Receive funds with a callback function
    receive() external payable{} 

    // Add funds
    function addFunds() payable public {
    }

    // Check balance
    function contractBalance() public view returns(uint){
        return address(this).balance;
    }

    // Spend money on EOA and Contracts
    function transfer (address payable to, uint amount) public payable {
        // check the amount on the smart contract is enough and that the sender is the owner of the contract
        require((amount <= contractBalance()), "The amount available in the contract is not enough"); 
        require(msg.sender == owner, "You are not the owner, aborting");

        to.transfer(amount);

    }

}