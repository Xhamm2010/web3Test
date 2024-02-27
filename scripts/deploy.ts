import { ethers } from "hardhat";

async function main() {

  const counterFactory = await ethers.deployContract("CounterFactory");

  await counterFactory.waitForDeployment();

  console.log(
    `counterFactory deployed to ${counterFactory.target}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});