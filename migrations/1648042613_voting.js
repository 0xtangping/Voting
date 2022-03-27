const voting = artifacts.require("Voting");
const safemath = artifacts.require("SafeMath");

module.exports = function (deployer) {
  deployer.deploy(safemath);
  deployer.link(safemath,voting);
  deployer.deploy(voting,[web3.utils.asciiToHex("Rama"), web3.utils.asciiToHex("Nick"), web3.utils.asciiToHex("Jose")])
};