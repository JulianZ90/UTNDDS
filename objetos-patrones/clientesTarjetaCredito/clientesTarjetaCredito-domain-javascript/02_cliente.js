function Cliente() {
    "use strict";

    this.deuda = 0;
    this.puntos = 0;
}

Cliente.prototype = {
    pagarVencimiento: function(monto) {
        "use strict";
        this.deuda = this.deuda - monto;
    },
    agregarPuntos: function(unosPuntos) {
        "use strict";
        this.puntos = this.puntos + unosPuntos;
    },
    getDeuda: function() {
        return this.deuda;
    },
    comprar: function(monto) {
        this.deuda = this.deuda + monto;
    },
    safeShop: function(unMontoMaximo) {
        var clienteDecorado = new Cliente();
        clienteDecorado.montoMaximo = unMontoMaximo;
        clienteDecorado.cliente = this;
        clienteDecorado.comprar = function(monto) {
            "use strict";
            if (monto > this.montoMaximo) {
                throw new Error("No debe comprar por mas de " + this.montoMaximo);
            }
            this.cliente.comprar(monto);
        };
        return clienteDecorado;
    },
    promocion: function() {
        var clienteDecorado = new Cliente();
        clienteDecorado.cliente = this;
        clienteDecorado.comprar = function(monto) {
            "use strict";
            this.cliente.comprar(monto);
            if (monto > 50) {
                this.cliente.agregarPuntos(15);
            }
        };
        return clienteDecorado;
    }
};

module.exports = {
    Cliente: Cliente,
};
