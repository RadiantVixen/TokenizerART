const hre = require("hardhat");

async function main() {
  const contractAddress = process.env.DEPLOYED_ADDRESS;
  const [owner] = await hre.ethers.getSigners();

  const contract = await hre.ethers.getContractAt(
    "Monkey42NFT",
    contractAddress
  );

  const tokenURI = "ipfs://bafkreiamw45essujvcgxsvqqic5opxngviirmxdhd26xgep23ujqc673hm";
  const tx = await contract.mintNFT(owner.address, tokenURI);
  await tx.wait();

  console.log("NFT minted:", tx.hash);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});