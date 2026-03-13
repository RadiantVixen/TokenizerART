# Monkey42NFT

Monkey42NFT is a non-fungible token (NFT) project created as part of the TokenizeArt challenge.  
This NFT represents a unique digital asset stored on the blockchain, featuring the number **42** in its design.

## Objectives
- Learn blockchain fundamentals and NFT standards.
- Create and deploy a unique NFT.
- Manage NFT metadata securely.
- Demonstrate smart contract functionality and ownership verification.

## Tools & Languages Used
- **Solidity** – programming language for Ethereum smart contracts.
- **OpenZeppelin ERC721** – secure, standard implementation of NFTs.
- **Remix IDE** – easy compilation and deployment in a browser environment.
- **MetaMask** – wallet for deploying and interacting with NFTs.
- **IPFS** – decentralized storage for NFT images and metadata.

**Why we chose these tools:**  
These tools provide a secure, standard-compliant, and beginner-friendly environment to build and deploy NFTs while focusing on learning blockchain concepts without handling real funds.

## Deployment
1. Open `Monkey42NFT.sol` in [Remix](https://remix.ethereum.org).
2. Compile using Solidity `^0.8.17`.
3. Deploy to a testnet (e.g., sepolia) using MetaMask.
4. Copy the contract address and verify it on [Etherscan](https://goerli.etherscan.io).

## How Users Can Interact
- **Mint NFT:** Call `mintNFT(address to)` to create a new token.  
- **Check Ownership:** Use `ownerOf(tokenId)` to confirm who owns a token.  
- **Track Supply:** Call `tokenCounter()` to see total minted NFTs.  

All interactions can be done directly on Etherscan if the contract is verified.

## Metadata Requirements
- Artist name: your login (e.g., `aichaatki`)
- NFT name: must include **42** and a title of your choice
- Image stored on **IPFS**.

## Deployment Info
- Contract Address: `0xYourContractAddress`
- Network: sepolia Testnet