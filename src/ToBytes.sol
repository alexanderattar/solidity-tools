// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Storage {
    function toBytes(
        address from,
        address to,
        uint256 amount
    ) public pure returns (bytes memory) {
        return abi.encode(from, to, amount);
    }
}
