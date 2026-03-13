# Using Monkey42NFT

## Features
- Mint unique NFTs with the number 42.
- Verify ownership using `ownerOf`.
- Track total supply using `tokenCounter`.
- All data stored securely on blockchain and IPFS.

## How it Works
1. The NFT is created with ERC721 standard.
2. Metadata includes your login and NFT title.
3. Image is stored on IPFS.
4. The smart contract controls minting and ownership.

## Security Considerations
- Only the contract owner can mint NFTs.
- Ownership functions are public and verifiable.
- Metadata cannot be modified after minting.