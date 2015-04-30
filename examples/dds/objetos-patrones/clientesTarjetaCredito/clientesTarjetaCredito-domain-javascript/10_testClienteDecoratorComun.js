var assert = require("assert");
var Cliente = require("./10_cliente").Cliente;
var ClienteConSafeShop = require("./10_cliente").ClienteConSafeShop;
var ClienteConPromocion = require("./10_cliente").ClienteConPromocion;

var manuel;
var ricardo;
var clienteSafe;
var clientePromo;

describe('clientes', function() {
    "use strict";
    var clienteSafe;

    beforeEach(function() {
        manuel = new Cliente();
        ricardo = new Cliente();
        manuel.deuda = 400;
        clienteSafe = new ClienteConSafeShop(manuel, 200);
        clientePromo = new ClienteConPromocion(ricardo);
    });
    it('should allow to buy', function() {
        clienteSafe.comprar(150);
        assert.equal(550, clienteSafe.getDeuda());
    });
    it('should not allow to buy', function() {
        assert.throws(function() {
            clienteSafe.comprar(250);
        }, Error, "No se puede comprar por mas del monto de safe shop");
    });
    it('should add points', function() {
        clientePromo.comprar(150);
        assert.equal(15, ricardo.puntos);
    });
});
