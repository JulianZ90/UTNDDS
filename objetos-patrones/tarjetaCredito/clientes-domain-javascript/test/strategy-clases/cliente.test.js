var assert = require("assert");
var Cliente = require("../../src/strategy-clases/cliente").Cliente;
var CriterioEspecial = require("../../src/strategy-clases/cliente").CriterioEspecial;

describe('#Cliente - Strategy Clases', function() {
    "use strict";
    var manuel;
    var ricardo;

    beforeEach(function() {
        manuel = new Cliente();
        ricardo = new Cliente();
        ricardo.criterioMontoCredito = new CriterioEspecial();
        ricardo.deuda = 1000;
    });
    it('should calculate left amount', function() {
        assert.equal(9000, ricardo.saldo());
    });
    it('should calculate maximum credit amount for a common customer', function() {
        assert.equal(3000, manuel.montoMaximoCredito());
    });
    it('should calculate maximum credit amount for a special customer', function() {
        assert.equal(4500, ricardo.montoMaximoCredito());
    });

});
