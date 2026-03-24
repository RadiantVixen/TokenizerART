// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts@4.9.3/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.9.3/access/Ownable.sol";
import "@openzeppelin/contracts@4.9.3/utils/Base64.sol";

contract Monkey42Custom is ERC721, Ownable {
    uint256 public tokenIdCounter;

    struct NFTData {
        string name;
        string description;
        string svg;
    }

    mapping(uint256 => NFTData) private nftData;

    constructor() ERC721("Monkey42 Explorer", "M42") {}

    function mintNFT(
        address recipient,
        string memory name_,
        string memory description_,
        string memory svg_
    ) public onlyOwner returns (uint256) {
        uint256 newId = tokenIdCounter;
        _safeMint(recipient, newId);

        nftData[newId] = NFTData({
            name: name_,
            description: description_,
            svg: svg_
        });

        tokenIdCounter++;
        return newId;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(_exists(tokenId), "Token does not exist");

        string memory imageURI = string(
            abi.encodePacked(
                "data:image/svg+xml;base64,",
                Base64.encode(bytes(nftData[tokenId].svg))
            )
        );

        string memory json = string(
            abi.encodePacked(
                '{"name":"', nftData[tokenId].name,
                '","description":"', nftData[tokenId].description,
                '","image":"', imageURI, '"}'
            )
        );

        return string(
            abi.encodePacked(
                "data:application/json;base64,",
                Base64.encode(bytes(json))
            )
        );
    }
}