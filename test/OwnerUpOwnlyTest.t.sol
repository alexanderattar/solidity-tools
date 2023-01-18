// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

import "./CheatCodes.sol";

error Unauthorized();

contract OwnerUpOnly {
    address public immutable owner;
    uint256 public count;

    constructor() {
        owner = msg.sender;
    }

    function increment() external {
        if (msg.sender != owner) {
            revert Unauthorized();
        }
        count++;
    }
}

import "ds-test/test.sol";

contract OwnerUpOnlyTest is DSTest {
    CheatCodes internal cheats;
    OwnerUpOnly upOnly;

    function setUp() public {
        upOnly = new OwnerUpOnly();
    }

    function testIncrementAsOwner() public {
        assertEq(upOnly.count(), 0);
        upOnly.increment();
        assertEq(upOnly.count(), 1);
    }

    function testFailIncrementAsNotOwner() public {
        // TODO: this cheatcode doesn't work for some reason
        cheats.expectRevert(Unauthorized.selector);
        cheats.prank(address(0));
        upOnly.increment();
    }
}
