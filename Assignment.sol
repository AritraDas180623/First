// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Contract {
    address public A; 
    address public B;  
    uint256 public deposit; 
    bool public Value;  
    constructor(address _B) payable {
        A = msg.sender;
        B = _B;
        deposit = msg.value;
        Value = false;
    }

    modifier onlyB() {
        require(msg.sender == B );
        _;
    }

    modifier check() {
        require(!Value);
        _;
    }

    function money() public onlyB check {
        Value = true;
        payable(B).transfer(deposit);
    }

    function getamount() public  view returns (uint256) {
        return deposit;
    }
}
