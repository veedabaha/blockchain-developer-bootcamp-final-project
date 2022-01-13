module.exports = {
  networks: {
    local: {
      host: "HTTP://127.0.0.1:7545",
      port: 7545 ,
      network_id: "*" // Match any network id
    }
  },
  // // To run contract with the latest compiler, uncomment lines 10-14 below:
  compilers: { 
    solc: {
      version: "0.7.6",    // Fetch latest 0.8.x Solidity compiler 
    }
  }
};
