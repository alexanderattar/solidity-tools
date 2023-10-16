// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface IERC721 {
    function ownerOf(uint256 tokenId) external view returns (address owner);
}

interface IHolographRegistry {
    function getContractTypeAddress(bytes32 contractType) external view returns (address);
}

contract HolographDropERC721 is IERC721 {
    function ownerOf(uint256 tokenId) external pure override returns (address owner) {
        return address(0); // dummy implementation
    }
}

contract CxipERC721 is IERC721 {
    function ownerOf(uint256 tokenId) external pure override returns (address owner) {
        return address(0); // dummy implementation
    }
}

contract TestContract {
    IHolographRegistry public registry;

    constructor(address _registry) {
        registry = IHolographRegistry(_registry);
    }

    // TODO - Dynamic version
    // function testGetContractTypeAddress() external view returns (address) {
    //     bytes32 hardcodedValue = 0x00000000000000000000000000486f6c6f677261706844726f70455243373231;
    //     registry.getContractTypeAddress(hardcodedValue);
    // }

    function testHolographDropAddress() external view returns (address) {
        bytes32 hardcodedValue = 0x00000000000000000000000000486f6c6f677261706844726f70455243373231;
        return registry.getContractTypeAddress(hardcodedValue);
    }

    function testCxipAddress() external view returns (address) {
        bytes32 hardcodedValue = 0x0000000000000000000000000000000000000000000043786970455243373231;
        return registry.getContractTypeAddress(hardcodedValue);
    }
}
