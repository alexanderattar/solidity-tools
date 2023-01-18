// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "ds-test/test.sol";

interface CheatCodes {
    function expectEmit(
        bool,
        bool,
        bool,
        bool
    ) external;
}

contract EmitContractTest is DSTest {
    event Transfer(address indexed from, address indexed to, uint256 amount);
    CheatCodes constant cheats = CheatCodes(HEVM_ADDRESS);

    function testExpectEmit() public {
        ExpectEmit emitter = new ExpectEmit();
        // check topic 1, topic 2, and data are the same as the following emitted event
        // checking topic 3 here doesn't matter if it's set to true or false, because `Transfer`
        // only has 2 indexed topics, `from` and `to`
        cheats.expectEmit(true, true, false, true);
        emit Transfer(address(this), address(1337), 1337); // expected event 1
        emitter.t(); // returned event 1
    }

    function testExpectEmitDoNotCheckData() public {
        ExpectEmit emitter = new ExpectEmit();
        // check topic 1, topic 2, do not check data
        cheats.expectEmit(true, true, false, false);
        emit Transfer(address(this), address(1337), 1338); // expected event 2
        emitter.t(); // returned event 2
    }
}

contract ExpectEmit {
    event Transfer(address indexed from, address indexed to, uint256 amount);

    function t() public {
        emit Transfer(msg.sender, address(1337), 1337);
    }
}
