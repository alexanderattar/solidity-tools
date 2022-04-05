// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "./CheatCodes.sol";
import "../MagicNumber.sol";

contract MagicNumberTest is DSTest {
    CheatCodes internal cheats;
    MagicNumber internal magic;

    uint256 magicNumber;

    function setUp() public {
        magicNumber = 42;
        magic = new MagicNumber(3);
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

    function testMagicNumberIsThree() public {
        assertEq(magic.getMagicNumber(), 3);
    }
}
