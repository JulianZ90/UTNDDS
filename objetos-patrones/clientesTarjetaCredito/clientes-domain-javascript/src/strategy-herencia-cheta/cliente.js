Function.prototype.extends = function(padre) {
    if (padre.constructor == Function) {
        this.prototype = new padre();
        this.prototype.constructor = this;
        this.prototype.parent = padre.prototype;
    } else {
        this.prototype = padre;
        this.prototype.constructor = this;
        this.prototype.parent = padre;
    }
};

function CriterioMontoCredito() { 
    // es loco que la "clase abstracta"
    // deba instanciarse como un objeto que guarda
    // las funciones
}

CriterioMontoCredito.prototype.montoMaximo = function(unCliente) {
    "use strict";

    return 0.3 * unCliente.ingreso;
};

function ClienteComun() {}
ClienteComun.extends(CriterioMontoCredito);

function ClienteEspecial() {}
ClienteEspecial.extends(CriterioMontoCredito);

ClienteEspecial.prototype.montoMaximo = function(unCliente) {
    "use strict";
    return this.parent.montoMaximo(unCliente) + 2000;
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
};
