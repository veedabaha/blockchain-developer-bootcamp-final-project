# Services management and a small business using blockchian
Blockchian has many facilities to builds some immutability ,transparency and decentralization systems ,these systems have some properties that can create , manage and disable tasks easily to save some data of engineers to login on this system. This system able to manage and store in the repository of etherum , some information of users and engineers into adopting this system and this system provides benefits to engineers that are willing to have some works to do and transfer their money without infraction .
# Services management and a small business using contract workflow
1.The engineers and customers or users will register on the smart contract

2.The customers can add their task on the contract

3.Engineers can access to the record of customer's task

4.The engineers can able to offer to the customer's tasks

5.If the customer acceptes the offer of the engineer payed the value of that task at three times

### Prerequisites
- Node.js >= v14
- Truffle and Ganache
- npm
### Contracts
- Clone code 
 ``
git clone https://github.com/veedabaha/blockchain-developer-bootcamp-final-project.git
``
- Run `npm install` in root to install Truffle build and smart contract dependencies
- Run local testnet in port `7545` with an Ethereum client, e.g. Ganache
- `truffle migrate --network development `
- In truffle-config.js file , Fill in the following below.
  - MNEMONIC=" your mnemonic here in quotes"
  - INFURA_URL=insert your infura url
  - `truffle migrate --network ropsten `

- Run tests `truffle test`

### Frontend
- `cd vapp`
- `npm install`
- `npm run serve`
- Open `http://localhost:8080` 

## structure
-`contracts`:  In this folder, the InterfaceOfCuntract.sol interface of the contract and have abstract methods.
   And contract SmallDailyBusiness.sol is the main contract.
-`truffle test`

- `build`: When compile the contract this folder created , its save **data/abi** .
- `migrations`: Migration files for deploying contracts in `contracts` directory.
- `vapp`: Project's Vue frontend.
- `test` : this is where the tests are stored. The test is written in truffle.




