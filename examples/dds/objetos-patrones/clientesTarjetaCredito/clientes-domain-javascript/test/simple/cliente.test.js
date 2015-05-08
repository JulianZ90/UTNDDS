var assert = require("assert");
var Cliente = require("../../src/simple/cliente");

var raul = {

    deuda: 0,
    comprar: function(monto) {
        this.deuda = this.deuda + monto;
    },
    pagarVencimiento: function(monto) {
        this.deuda = this.deuda - monto;
    }
};

describe('#Cliente - Simple', function() {
    "use strict";

    var manuel;

    beforeEach(function() {
        manuel = new Cliente();
        manuel.comprar(500);
        raul.deuda = 0;
        raul.comprar(500);
    });
    it('should increase debt if customer buys something', function() {
        assert.equal(500, manuel.deuda);
        assert.equal(500, raul.deuda);
    });
    it('should decrease debt if customer pays an amount', function() {
        manuel.pagarVencimiento(300);
        raul.pagarVencimiento(300);
        assert.equal(200, manuel.deuda);
        assert.equal(200, raul.deuda);
    });

});
