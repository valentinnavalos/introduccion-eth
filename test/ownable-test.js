const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Ownable", function () {
  beforeEach(async function () {
    [this.martin, this.juana] = await hre.ethers.getSigners();
    this.Ownable = await hre.ethers.getContractFactory("Ownable");
    this.ownable = await this.Ownable.deploy(this.juana.address);
    await this.ownable.deployed();
  });

  it("Tenga owner correcto", async function () {
    const owner = await this.ownable.owner();
    expect(owner).to.equal(this.juana.address);
  });

  it("Solo el owner pueda transferir ownership", async function () {
    await expect(
      this.ownable.transferOwnership(this.martin.address)
    ).to.be.revertedWith("No es el owner");
  });
});

// it("Emita evento de OwnershipTransferred", async function () {
//   await expect(
//     this.ownable.connect(this.juana).transferOwnership(this.martin.address)
//   )
//     .to.emit(this.ownable, "OwnershipTransferred")
//     .withArgs(this.juana.address, this.martin.address);
// });
