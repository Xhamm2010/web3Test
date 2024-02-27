import { ethers } from "hardhat";

const main = async () => {
    const counterFactory = await ethers.getContractAt("CounterFactory", "0xaaE60aF6D67223c39A8888BE28A5774c395421AE");

    const createCounterTx = await counterFactory.createCounter();
    await createCounterTx.wait();

    const counterAddress = await counterFactory.getCounter();
    console.log(counterAddress);

    const counter = await ethers.getContractAt("Counter", counterAddress);
    console.log(await counter.increment());
};

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});