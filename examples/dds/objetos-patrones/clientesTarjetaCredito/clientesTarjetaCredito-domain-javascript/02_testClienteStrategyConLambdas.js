var assert = require("assert");
var Cliente = require("./02_cliente");

describe('clientes', function() {
    "use strict";
    var manuel;

    beforeEach(function() {
        manuel = new Cliente();
    });
    it('should calculate maximum credit amount for a common customer', function() {
        assert.equal(3000, manuel.montoMaximoCredito());
    });
    it('should calculate maximum credit amount for a special customer', function() {
        manuel.deuda = 1000;
        manuel.montoMaximoCredito = function() {
            return 0.5 * (this.ingreso - this.deuda);
        };
        assert.equal(4500, manuel.montoMaximoCredito());
    });

});
