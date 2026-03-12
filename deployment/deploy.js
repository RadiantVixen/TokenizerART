const hre = require("hardhat");

async function main() {
  const Monkey42 = await hre.ethers.getContractFactory("Monkey42NFT");
  const contract = await Monkey42.deploy();
  await contract.deployed();
  console.log("Deployed at:", contract.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});