const transacaoParcelada = artifacts.require("transacaoParcelada");

module.exports = function (deployer, network, accounts) {
    deployer.deploy(transacaoParcelada, BigInt(1));
};
