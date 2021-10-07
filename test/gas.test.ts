import chai, { expect } from 'chai';
import asPromised from 'chai-as-promised';
import { ethers } from 'hardhat';
import { Signer } from 'ethers';
import { Gas } from '../typechain';

chai.use(asPromised);

describe('Gas', () => {
  let deployer: Signer;
  let user: Signer;
  let testContract: Gas;

  beforeEach(async () => {
    const signers = await ethers.getSigners();
    deployer = signers[0];
    user = signers[1];

    const GasFactory = await ethers.getContractFactory('Gas');
    testContract = (await GasFactory.deploy()) as Gas;
    await testContract.deployed();
  });

  it('writeData(100)', async () => {
    await testContract.connect(user).writeData(100);
  });
  it('writeData(200)', async () => {
    await testContract.connect(user).writeData(200);
  });
  it('writeData(300)', async () => {
    await testContract.connect(user).writeData(300);
  });
  it('writeData(400)', async () => {
    await testContract.connect(user).writeData(400);
  });
  it('writeData(500)', async () => {
    await testContract.connect(user).writeData(500);
  });
  it('writeData(500)', async () => {
    await testContract.connect(user).writeData(500);
  });
  it('writeData(1500)', async () => {
    await testContract.connect(user).writeData(1500);
  });
});
