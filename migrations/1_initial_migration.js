var Migrations = artifacts.require("./Migrations.sol");
var KoolKidz = artifacts.require('./KoolKidz.sol');

module.exports = function(deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(KoolKidz);
};
