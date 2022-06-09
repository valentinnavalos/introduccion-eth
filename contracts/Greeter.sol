//SPDX-License-Identifier: Unlicense
// solidity version that was used to generate this file
pragma solidity ^0.8.0; //--> "cualquier versión mayor o igual a 0.8.0 messirve"
//              >SemVer --> Semantic Versioning

// cada 'contract' es un contrato, hence podemos tener 70 en un mismo archivo. y van a hacer todos distintos.
contract Greeter {
    // atributos del contrato. Sus variables.
    string private greeting; //--> estado de memoria persistente.

    // código que se ejecuta al momento de hacer el deployment.--> subir el contrato a la blockchain.
    // luego del success deploy, se dropea el constructor, se borra.
    constructor(string memory _greeting) {
        greeting = _greeting;//--> defino el valor de greeting.
    }

    // --- función de lectura. ---
    // que sea 'public' significa que CUALQUIERA PUEDE LLAMAR A ESTA FUNCIÓN.
    // que sea 'view' significa que no se van a realizar cambios en el storage.
    function greet() public view returns (string memory) {
        return greeting;
    }

    // --- función de escritura. --- 
    function setGreeting(string memory _greeting) public {
        greeting = _greeting;
    }
}
