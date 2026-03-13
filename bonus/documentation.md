# Monkey42NFT — Interaction Guide

This document explains how to interact with the **Monkey42NFTOnChain** smart contract.  
The contract stores both **metadata and the NFT image fully on-chain** using Base64 encoding.

---

## 1. Overview

Monkey42NFTOnChain is an ERC-721 compliant smart contract.  
It allows the owner of the contract to mint NFTs with:

- On-chain JSON metadata  
- On-chain Base64 encoded image  
- Human-readable fields (name, description, creator)

Users can then read metadata, verify ownership, and interact with the token through standard ERC-721 functions.

---

## 2. Smart Contract Functions

### **mintNFT**
Creates a new NFT and stores its metadata + image directly on-chain.

0x1C52cF9Be0A82f06F5481F839FC67362A5Aa1D6F