var clienteComun = function(cliente) {
    "use strict";

    return 0.3 * cliente.deuda;
};

// Definición de un cliente
function Cliente() {
    "use strict";

    // Atributos
    this.deuda = 0;
    this.ingreso = 10000;

    // Métodos
    this.montoMaximoCredito = function() {
        return 0.3 * this.ingreso;
    };

}

module.exports = Cliente;
