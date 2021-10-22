const { ethers, upgrades } = require('hardhat');

async function main() {
  const BoxV2 = await ethers.getContractFactory('BoxV2');
  console.log('Upgrading Box...');
  await upgrades.upgradeProxy(
    '0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0',
    BoxV2
  );
  console.log('Box upgraded');
}

main();
