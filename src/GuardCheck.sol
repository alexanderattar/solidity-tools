// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract GuardCheck {
    function donate(address payable addr) public payable {
        require(addr != address(0));
        require(msg.value != 0);
        uint256 balanceBeforeTransfer = address(this).balance;
        uint256 transferAmount;

        if (addr.balance == 0) {
            transferAmount = msg.value;
        } else if (addr.balance < msg.sender.balance) {
            transferAmount = msg.value / 2;
        } else {
            revert();
        }

        addr.transfer(transferAmount);
        assert(address(this).balance == balanceBeforeTransfer - transferAmount);
    }
}
