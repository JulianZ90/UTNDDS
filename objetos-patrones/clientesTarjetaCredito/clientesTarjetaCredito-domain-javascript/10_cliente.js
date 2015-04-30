function Cliente() {
    "use strict";

    this.deuda = 0;
    this.puntos = 0;
}

Cliente.prototype.pagarVencimiento = function(monto) {
    "use strict";
    this.deuda = this.deuda - monto;
};

Cliente.prototype.agregarPuntos = function(unosPuntos) {
    "use strict";

    this.puntos = this.puntos + unosPuntos;
};

Cliente.prototype.getDeuda = function() {
    return this.deuda;
};

Cliente.prototype.comprar = function(monto) {
    this.deuda = this.deuda + monto;
};

function ClienteDecorator(unCliente) {
    "use strict";
    this.cliente = unCliente;
}

ClienteDecorator.prototype.comprar = function(monto) {
    "use strict";
    return this.cliente.comprar(monto);
};

ClienteDecorator.prototype.getDeuda = function() {
    "use strict";
    return this.cliente.getDeuda();
};

ClienteDecorator.prototype.agregarPuntos = function(unosPuntos) {
    "use strict";
    return this.cliente.agregarPuntos(unosPuntos);
};

function ClienteConSafeShop(unCliente, unMontoMaximo) {
    "use strict";

    this.montoMaximo = unMontoMaximo;
    this.cliente = unCliente;
    this.prototype = new ClienteDecorator(unCliente);
}

ClienteConSafeShop.prototype = Object.create(ClienteDecorator.prototype);

ClienteConSafeShop.prototype.comprar = function(monto) {
    "use strict";
    if (monto > this.montoMaximo) {
        throw new Error("No debe comprar por mas de " + this.montoMaximo);
    }
    this.cliente.comprar(monto);
};

function ClienteConPromocion(unCliente) {
    "use strict";
    this.cliente = unCliente;
}

ClienteConPromocion.prototype = Object.create(ClienteDecorator.prototype);

ClienteConPromocion.prototype.comprar = function(monto) {
    "use strict";
    this.cliente.comprar(monto);
    if (monto > 50) {
        this.cliente.agregarPuntos(15);
    }
};

module.exports = {
    Cliente: Cliente,
    ClienteConPromocion: ClienteConPromocion,
    ClienteConSafeShop: ClienteConSafeShop
};
