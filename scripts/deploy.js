const { ethers } = require("hardhat");

async function main() {
  // Deploy the ERC721 contract
  const AbhishekERC1155 = await ethers.getContractFactory("ERC1155Token");
  const AbhishekERC1155Token = await AbhishekERC1155.deploy(); // Pass the arguments

  //await Abhisheknft.deployed();

  console.log("Abhishek Token deployed to:", AbhishekERC1155Token.target);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });