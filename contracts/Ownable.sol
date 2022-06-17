//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Ownable {
    // address es un tipo de dato nativo y simple (no complejo) de solidity.
    address public owner;
    // public, cualquier persona puede venir y preguntar quien es el dueño.

    // modifier: es una función que se ejecuta antes de que se ejecute la función que se le pasa como parámetro.
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    // --> es una fn modificadora.
    // los modifiers pueden ser de visiblidad, pueden ser custom

    constructor(address _owner) {
        //..-> los constructores no requieren visibilidad.
        owner = _owner;
        // al deployar el contrato, le voy a pasar al constructor la address que quiero que sea el dueño.
    }

    function transferOwnership (address newOwner) onlyOwner public {
        // le agg el modifier para que solo el dueño pueda llamar a la fn.
        // --> transferOwnership() ahora esta protegida por el modifier onlyOwner.

        // esta fn es pública porque queremos que el dueño llame a esta función.
        // si fuese privada, solo se podria llamar desde dentro del contrato. 
        // --> lo mismo que dejar la llave adentro. 
        owner = newOwner;
    }
    // suele heredarse de este contrato, para escribirse otros contratos que tengan un dueño tmb.
    // y utilizar esta misma fn.
}
