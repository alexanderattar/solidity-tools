// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.10;

contract MagicNumber {
    uint256 public magicNumber;

    constructor(uint256 _num) {
        magicNumber = _num;
    }

    function setMagicNumber(uint256 _num) public {
        magicNumber = _num;
    }

    function getMagicNumber() public view returns (uint256) {
        return magicNumber;
    }
}
