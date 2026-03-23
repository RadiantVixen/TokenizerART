# Monkey42NFT — Enhanced Interaction Guide

This guide explains how to use the `Monkey42NFT` bonus frontend and Sepolia deployment for minting and reading NFTs.

## 1) What this project does

The NFT flow is designed for on-chain metadata usage:

- Mint NFTs to a recipient address
- Read `tokenURI(tokenId)`
- Check ownership with `ownerOf(tokenId)`
- View the current `tokenIdCounter()`

## 2) Deployment reference

- **Network:** Sepolia
- **Contract address:** `0x3dA4B2De0C41FD930851d3E36d67C2FdB8EEccE7`
- **Etherscan:** `https://sepolia.etherscan.io/address/0x3dA4B2De0C41FD930851d3E36d67C2FdB8EEccE7`
- **Write Contract:** `https://sepolia.etherscan.io/address/0x3dA4B2De0C41FD930851d3E36d67C2FdB8EEccE7#writeContract`

## 3) Local frontend usage (`bonus/index.html`)

From the repository root, run:

```bash
python3 -m http.server 3000
```

Then open:

- `http://localhost:3000/bonus/index.html`

### Frontend flow

1. Click **Connect Wallet**
2. Approve MetaMask connection
3. Confirm you are on **Sepolia** (chain id `0xaa36a7`)
4. Use the action panels:
   - **Mint New NFT**
   - **Read tokenURI**
   - **Check Ownership**
   - **Total NFTs Minted**

## 4) Function reference (frontend ABI)

The current bonus UI calls:

### `mintNFT(address recipient, string name_, string description_, string svg_)`

- Mints an NFT (owner-restricted in most implementations)
- Returns the newly minted token id

### `tokenURI(uint256 tokenId)`

- Returns metadata URI for a token

### `ownerOf(uint256 tokenId)`

- Returns current owner of a token

### `tokenIdCounter()`

- Returns minted token count counter

## 5) Input guidance

### Recipient

- Must be a valid EVM address (e.g. `0x...`)

### Name / Description

- Plain UTF-8 strings are acceptable

### Base64 image field (`svg_` in ABI)

- Provide Base64-encoded image content as expected by your contract
- Common patterns are raw Base64 payloads or full data URIs such as:
  - `data:image/svg+xml;base64,...`

## 6) Common issues and fixes

### Wallet button does nothing

- Ensure MetaMask is installed and unlocked
- Serve via `http://localhost` (not `file://`)
- Confirm internet access for the ethers CDN script

### Wrong network

- Switch MetaMask to **Sepolia**
- The UI requests a chain switch automatically where supported

### Mint reverts

- You may not be the contract owner
- Parameters may not match contract validation rules
- Check revert reason in MetaMask and browser console

## 7) Important repo note

There is a function-signature difference between files:

- `bonus/index.html` expects `mintNFT(recipient, name_, description_, svg_)`
- `code/Monkey42NFT.sol` currently shows `mintNFT(address recipient, string tokenURI)`

If you redeploy from `code/Monkey42NFT.sol`, update the frontend ABI and mint form to match that contract signature.

## 8) Security and operational notes

- Keep owner/private keys out of source files
- Test minting on Sepolia before any mainnet deployment
- Verify contract source on Etherscan to simplify trust and debugging