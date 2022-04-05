// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.12;

import "ds-test/test.sol";
import "./CheatCodes.sol";

contract MagicNumberTest is DSTest {
    CheatCodes internal cheats;
    uint256 magicNumber;

    function setUp() public {
        magicNumber = 42;
    }

    function testExample() public {
        assertTrue(true);
    }

    function magicNumberIs42() public {
        assertEq(magicNumber, 42);
    }

    function testFailSubtract43() public {
        magicNumber -= 43;
    }
}
