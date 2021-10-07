import chai, { expect } from 'chai';
import asPromised from 'chai-as-promised';
import { ethers } from 'hardhat';
import { Signer } from 'ethers';
import { TestMagicNumber } from '../typechain';

chai.use(asPromised);

describe('TestMagicNumber', () => {
  let deployer: Signer;
  let user: Signer;
  let testContract: TestMagicNumber;

  beforeEach(async () => {
    const signers = await ethers.getSigners();
    deployer = signers[0];
    user = signers[1];

    const TestContractFactory = await ethers.getContractFactory(
      'TestMagicNumber'
    );
    testContract = (await TestContractFactory.deploy(42)) as TestMagicNumber;
    await testContract.deployed();
  });

  it('should have the default magic number set', async () => {
    const magicNumber = await testContract.magicNumber();

    expect(magicNumber.toNumber()).to.eq(42);
  });

  describe('#setMagicNumber', () => {
    it('should set the magic number', async () => {
      await testContract.connect(user).setMagicNumber(111);

      const magicNumber = await testContract.magicNumber();

      expect(magicNumber.toNumber()).to.eq(111);
    });
  });
});
