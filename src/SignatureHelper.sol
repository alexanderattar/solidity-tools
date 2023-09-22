// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SignatureHelper {
    // This function returns the function selector for a given function signature
    function getFunctionSignature(string memory functionSignature) public pure returns (bytes4) {
        return bytes4(keccak256(bytes(functionSignature)));
    }
}
