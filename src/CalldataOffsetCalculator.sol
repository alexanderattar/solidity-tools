// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalldataOffsetCalculator {
    // Calculate the calldata offset for a bytes or string parameter
    function calculateOffsetLength(uint256 paramsBeforeBytes) public pure returns (uint256) {
        return 4 + (paramsBeforeBytes * 32);
    }

    // Convert the offset to bytes32 to see the representation in hexadecimal
    function calculateOffsetLengthAsBytes32(uint256 paramsBeforeBytes) public pure returns (bytes32) {
        uint256 offset = calculateOffsetLength(paramsBeforeBytes);
        return bytes32(offset);
    }

    function calculatePosition(uint256 paramsBeforeBytes) public pure returns (uint256) {
        return 4 + (paramsBeforeBytes * 32); // 4 bytes for the function selector
    }

    // Convert the offset to bytes32 to see the representation in hexadecimal
    function calculatePositionAsBytes32(uint256 paramsBeforeBytes) public pure returns (bytes32) {
        uint256 position = calculatePosition(paramsBeforeBytes);
        return bytes32(position);
    }
}
