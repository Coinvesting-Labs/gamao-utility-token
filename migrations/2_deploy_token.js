// Destination
const TechnicalAndOperationalReserve = artifacts.require("MultiSigWallet");
let communityDevelopment = "0xfb84fc6Eb3C040f04B9A74149eC6AD3326079292";

// BEP20 Token
const GAMAO = artifacts.require("Gamao");


// Total supply
let totalSupply = web3.utils.toWei("10000000000","ether");

module.exports = async function (deployer, network, accounts) {
  const technicalAndOperationalReserve = await TechnicalAndOperationalReserve.deployed();

  await deployer.deploy(
    GAMAO, 
    "GAMA Utility Token", 
    "GAMAO", 
    totalSupply,
    communityDevelopment,
    technicalAndOperationalReserve.address
  );

  
  const gamao = await GAMAO.deployed();
  
  technicalAndOperationalReserve.setTokenContract(gamao.address);
};
