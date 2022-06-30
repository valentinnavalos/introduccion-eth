const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Ownable", function () {
  beforeEach(async function () {
    [this.martin, this.juana] = await hre.ethers.getSigners();
    this.Ownable = await hre.ethers.getContractFactory("Ownable");
    this.ownable = await this.Ownable.deploy(this.martin.address);
    await this.ownable.deployed();
  });

  it("Tenga owner correcto", async function () {
    const owner = await this.ownable.owner();
    expect(owner).to.equal(this.martin.address);
  });
});

// expect(await greeter.greet()).to.equal("Hello, world!");
// const setGreetingTx = await greeter.setGreeting("Hola, mundo!");
// // wait until the transaction is mined
// await setGreetingTx.wait();
// expect(await greeter.greet()).to.equal("Hola, mundo!");