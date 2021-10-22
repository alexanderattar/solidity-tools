import * as dotenv from 'dotenv';
import { HardhatUserConfig } from 'hardhat/config';
import 'hardhat-typechain';
import 'tsconfig-paths/register';
import 'hardhat-gas-reporter';

import '@nomiclabs/hardhat-ethers';
import '@openzeppelin/hardhat-upgrades';

dotenv.config();
const INFURA_API_KEY = process.env.INFURA_API_KEY || '';
const RINKEBY_URL = process.env.RINKEBY_URL || '';
const RINKEBY_PRIVATE_KEY =
  process.env.RINKEBY_PRIVATE_KEY! ||
  '0xc87509a1c067bbde78beb793e6fa76530b6382a4c0241e5e4a9ec0a0f44dc0d3'; // well known private key

const ROPSTEN_URL = process.env.ROPSTEN_URL || '';
const ROPSTEN_PRIVATE_KEY =
  process.env.ROPSTEN_PRIVATE_KEY! ||
  '0xc87509a1c067bbde78beb793e6fa76530b6382a4c0241e5e4a9ec0a0f44dc0d3'; // well known private key
const ETHERSCAN_API_KEY = process.env.ETHERSCAN_API_KEY;

const config: HardhatUserConfig = {
  networks: {
    localhost: {},
    hardhat: {
      blockGasLimit: 30_000_000,
    },
    coverage: {
      url: 'http://127.0.0.1:8555',
    },
  },
  solidity: {
    compilers: [
      {
        version: '0.8.5',
      },
    ],
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
    },
  },
  mocha: {
    timeout: 60000,
  },
  gasReporter: {
    enabled: process.env.REPORT_GAS ? true : false,
    currency: 'USD',
    gasPrice: 100,
    coinmarketcap: process.env.COINMARKETCAP_API_KEY,
  },
};

export default config;
