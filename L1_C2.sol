// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract Switch{
    bool public isOn;

    function turnOn() public{
        isOn = true;
    }

    function turnOff() public{
        isOn = false;
    }

    function checkState() public view returns(string memory) {
        if (isOn == true){
            return "Switch is ON";
        }else{
            return "Switch is OFF";
        }
    }
}
