var assert = require("assert");

var Cliente = require("../../src/strategy-herencia-klass/cliente").Cliente;
var ClienteEspecial = require("../../src/strategy-herencia-klass/cliente").ClienteEspecial;

describe('#Cliente - Herencia Klass', function() {
    var manuel;
    var ricardo;

    beforeEach(function() {
        manuel = new Cliente();
        ricardo = new Cliente();
        ricardo.deuda = 1000;
    });
    it('should calculate left amount', function() {
        assert.equal(9000, ricardo.saldo());
    });
    it('should calculate maximum credit amount for a common customer', function() {
        assert.equal(3000, manuel.montoMaximoCredito());
    });
    it('should calculate maximum credit amount for a special customer', function() {
        ricardo.criterioMontoCredito = new ClienteEspecial();
        assert.equal(5000, ricardo.montoMaximoCredito());
    });

});
