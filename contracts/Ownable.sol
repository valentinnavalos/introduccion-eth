//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Ownable {
    // address es un tipo de dato nativo y simple (no complejo) de solidity.
    address public owner;
    // public --> cualquier persona puede venir y preguntar quien es el dueño.

    // tiene 2 parámetros: previousOwner y newOwner.
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    // se indexa para que sea más eficiente.


    // modifier: es una función que se ejecuta antes de que se ejecute la función que se le pasa como parámetro.
    modifier onlyOwner {
        require(msg.sender == owner);
        // acá estamos seteando que se llame a transferOwnership() solo si msg.sender es 'owner'.
        // "requiero que el msg.sender sea owner."

        // require --> es una fn que toma un bool.
        // si el bool es false, se rompe el programa y revierte.
        // si el bool es true,  continua.

        _;
        // _ --> es una variable que se usa para que se ejecute la función que se le pasa como parámetro.
        // que corra el cuerpo de la fn modificada.
    }
    // --> es una fn modificadora.
    // los modifiers pueden ser de visiblidad, pueden ser custom.

    constructor(address _owner) {
        //--> los constructores no requieren visibilidad.
        owner = _owner;
        // al deployar el contrato, le voy a pasar al constructor la address que quiero que sea el dueño.
    }

    function transferOwnership (address newOwner) onlyOwner public {
        // le agg el modifier para que solo el dueño pueda llamar a la fn.
        // --> transferOwnership() ahora esta protegida por el modifier onlyOwner.

        // esta fn es pública porque queremos que el dueño llame a esta función.
        // si fuese privada, solo se podria llamar desde dentro del contrato. 
        // --> lo mismo que dejar la llave adentro. 
        address previousOwner = owner;
        owner = newOwner;
        emit OwnershipTransferred(previousOwner, newOwner);
        // si quiero saber todos los dueños que tuvo este contrato, voy a mirar los logs de este contrato,
        // y mirar todos los eventos OwnershipTransferred que hubo.
    }
    // suele heredarse de este contrato, para escribirse otros contratos que tengan un dueño tmb.
    // y utilizar esta misma fn.
}
