// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Slot {
    bytes32 slot;

    function setSlot(string memory _slot) public {
        slot = bytes32(uint256(keccak256(bytes(_slot))) - 1);
    }

    function getSlot() public view returns (bytes32) {
        return slot;
    }
}
