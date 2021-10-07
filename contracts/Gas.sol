// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Gas {
    event GasEvent(uint256 data);

    mapping(uint256 => uint256) public mappingStorage;

    function writeData(uint256 _times) public {
        for (uint256 i = 0; i < _times; i++) {
            mappingStorage[i] = 1;
        }
    }

    function readData(uint256 _times) public {
        uint256 tmp;
        for (uint256 i = 0; i < _times; i++) {
            tmp = mappingStorage[i];
        }
        emit GasEvent(_times);
    }
}
