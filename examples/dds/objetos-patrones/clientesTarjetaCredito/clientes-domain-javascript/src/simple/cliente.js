// Definición de un cliente
function Cliente() {
    "use strict";

    // Atributos
    this.deuda = 0;

    // Métodos
    this.comprar = function(monto) {
        this.deuda = this.deuda + monto;
    };

    this.pagarVencimiento = function(monto) {
        this.deuda = this.deuda - monto;
    };
}

module.exports = Cliente;
