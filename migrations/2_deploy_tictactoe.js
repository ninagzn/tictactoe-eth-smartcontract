var TicTacToe = artifacts.require("./TicTacToe.sol");

module.exports = function (deployer) {
    deployer.deploy(TicTacToe,
    '0xc9B86278049F1fc452D900332E0F5C65f7A5BFb5');
};