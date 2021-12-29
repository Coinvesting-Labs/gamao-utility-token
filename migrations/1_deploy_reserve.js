// Destination
const TechnicalAndOperationalReserve = artifacts.require("MultiSigWallet");

module.exports = async function (deployer, network, accounts) {
  await deployer.deploy(TechnicalAndOperationalReserve);
};
