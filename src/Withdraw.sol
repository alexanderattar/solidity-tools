pragma solidity 0.8.13;

contract Withdraw {
    function withdraw() external {
        msg.sender.call{value: address(this).balance, gas: 210_000}("");
    }
}
