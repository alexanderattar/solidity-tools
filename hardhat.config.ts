import { HardhatUserConfig } from 'hardhat/config';
import '@nomiclabs/hardhat-ethers';
import 'hardhat-typechain';
import 'tsconfig-paths/register';
import 'hardhat-gas-reporter';

import * as dotenv from 'dotenv';
dotenv.config();

const config: HardhatUserConfig = {
  networks: {
    hardhat: {
      blockGasLimit: 30_000_000,
    },
  },
  solidity: {
    version: '0.8.5',
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
    },
  },
  gasReporter: {
    currency: 'USD',
    gasPrice: 100,
    coinmarketcap: process.env.COINMARKETCAP_API_KEY,
  },
};

export default config;
