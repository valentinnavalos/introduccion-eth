// registramos este pluggin para que hardhat lo use
require("@nomiclabs/hardhat-waffle");

const { url, mnemonic } = require('./secrets.json')

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
// Creamos una task. Una task es una tarea que ejecutamos regularmente cuando
// estamos codeando, como pueden ser compilaciones, test, etc.
task(
  /*este 'accounts' es como llamo a la task*/ "accounts",
  "Prints the list of accounts",
  async (taskArgs, hre) => {
    // hre es una instancia de Hardhat Runtime Environment (un objeto) que nos
    // permite acceder a todas las funciones de Hardhat.

    // Obtenemos la lista de accounts con la lib ethers --> cliente xa hablar con el nodo que estamos usando
    const accounts = await hre.ethers.getSigners();
    // esta instancia de ethersjs que viene dentro del hre ya viene con todo
    // preconfigurado.

    for (const account of accounts) {
      console.log(account.address);
    }
  }
);

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  // le ponemos la version de solidity que querramos usar
  // --> hardhat--> antes de correr un script compila tus contractos y ahí los corre.
  solidity: "0.8.4",
  networks: {
    rinkeby: {
      // las ctas que van a usarse cuando hablemos con esta red.
      accounts: { mnemonic },
      // url del nodo que vamos a usar.
      url: url,
    },
  },
};
