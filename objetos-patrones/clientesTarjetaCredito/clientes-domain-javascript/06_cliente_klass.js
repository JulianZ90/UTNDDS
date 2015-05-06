var klass = require('klass');

var CriterioMontoCredito = klass(function() {})
    .methods({
        montoMaximo: function(unCliente) {
            "use strict"
            return 0.3 * unCliente.ingreso;
        }
    });

var ClienteComun = CriterioMontoCredito.extend(function() {});

var ClienteEspecial = CriterioMontoCredito.extend(function() {})
    .methods({
        montoMaximo: function(unCliente) {
            "use strict"
            return this.supr(unCliente) + 2000;
        }
    });

// Definición de un cliente
function Cliente() {
    "use strict";

    // Atributos
    this.deuda = 0;
    this.ingreso = 10000;
    this.criterioMontoCredito = new ClienteComun();

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
    ClienteComun: ClienteComun,
    ClienteEspecial: ClienteEspecial,
};
