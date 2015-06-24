function CriterioMontoCredito() {
}

CriterioMontoCredito.prototype.montoMaximo = function(unCliente) {
    "use strict";

    return 0.3 * unCliente.ingreso;
};

function CriterioComun() {}

// Definimos la herencia definiendo CriterioMontoCredito
// como prototype de cada criterio
CriterioComun.prototype = Object.create(CriterioMontoCredito.prototype);
//

function CriterioEspecial() {
    "use strict";
    this.prototype = new CriterioMontoCredito();

    this.montoMaximo = function(unCliente) {
        return this.prototype.montoMaximo(unCliente) + 2000;
    };

}


// Definición de un cliente
function Cliente() {
    "use strict";

    // Atributos
    this.deuda = 0;
    this.ingreso = 10000;
    this.criterioMontoCredito = new CriterioComun();

    // Métodos
    this.montoMaximoCredito = function() {
        return this.criterioMontoCredito.montoMaximo(this);
    };

    this.saldo = function() {
        return this.ingreso - this.deuda;
    };

}

module.exports = {
    Cliente: Cliente,
    CriterioComun: CriterioComun,
    CriterioEspecial: CriterioEspecial,
    CriterioMontoCredito: CriterioMontoCredito
};
