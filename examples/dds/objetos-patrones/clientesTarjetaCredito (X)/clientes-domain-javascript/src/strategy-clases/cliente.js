function CriterioComun() {
    "use strict";

    this.montoMaximo = function(unCliente) {
        return 0.3 * unCliente.ingreso;
    };

}

function CriterioEspecial() {
    "use strict";

    this.montoMaximo = function(unCliente) {
        return 0.5 * unCliente.saldo();
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
    CriterioEspecial: CriterioEspecial
};
