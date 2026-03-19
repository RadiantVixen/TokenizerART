// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.3/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.3/contracts/access/Ownable.sol";

contract Monkey42NFTOnChain is ERC721, Ownable {
    uint256 public tokenIdCounter;
    mapping(uint256 => string) private _metadata;

    constructor() ERC721("Monkey42 Explorer", "M42") {}

    function mintNFT(
        address recipient,
        string memory name,
        string memory description,
        string memory base64Image
    ) public onlyOwner returns (uint256) {

        string memory json = string(
            abi.encodePacked(
                '{"name":"',name,
                '","description":"',description,
                '","image":"data:image/png;base64,',base64Image,
                '","creator":"aatki"}'
            )
        );

        uint256 newId = tokenIdCounter;
        _safeMint(recipient, newId);
        _metadata[newId] = json;
        tokenIdCounter++;

        return newId;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(_exists(tokenId), "Token does not exist");

        return string(
            abi.encodePacked(
                "data:application/json;base64,",
                _base64(bytes(_metadata[tokenId]))
            )
        );
    }

    function _base64(bytes memory data) internal pure returns (string memory) {
        string memory TABLE = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
        uint256 encodedLen = 4 * ((data.length + 2) / 3);

        bytes memory result = new bytes(encodedLen);
        uint256 i = 0;
        uint256 j = 0;

        while (i < data.length) {
            uint256 a = uint8(data[i++]);
            uint256 b = i < data.length ? uint8(data[i++]) : 0;
            uint256 c = i < data.length ? uint8(data[i++]) : 0;

            uint256 triple = (a << 16) | (b << 8) | c;

            result[j++] = bytes(TABLE)[(triple >> 18) & 0x3F];
            result[j++] = bytes(TABLE)[(triple >> 12) & 0x3F];
            result[j++] = i - 1 < data.length
                ? bytes(TABLE)[(triple >> 6) & 0x3F]
                : bytes1("=");

            result[j++] = i < data.length
                ? bytes(TABLE)[triple & 0x3F]
                : bytes1("=");
        }

        return string(result);
    }
}
