# Minting Your NFT

1. Connect MetaMask to the same testnet used for deployment.
2. Go to Etherscan → Your contract → Write Contract tab.
3. Call the `mintNFT` function with the recipient address.
4. Check NFT ownership using `ownerOf(tokenId)`.
5. Track total NFTs minted with `tokenCounter()`.