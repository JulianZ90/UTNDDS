function CriterioMontoCredito() {
    "use strict";
}

CriterioMontoCredito.prototype.montoMaximo = function(unCliente) {
    "use strict";

    return 0.3 * unCliente.ingreso;
};

function ClienteComun() {}

function ClienteEspecial() {
    "use strict";
    this.prototype = new CriterioMontoCredito();
}

// Definimos la herencia definiendo CriterioMontoCredito
// como prototype de cada subclase
ClienteComun.prototype = Object.create(CriterioMontoCredito.prototype);

ClienteEspecial.prototype = Object.create(CriterioMontoCredito.prototype);
ClienteEspecial.prototype.montoMaximo = function(unCliente) {
    "use strict";

    return this.prototype.montoMaximo(unCliente) + 2000;
};
//

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
    CriterioMontoCredito: CriterioMontoCredito
};