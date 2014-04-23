package ar.edu.clientesTarjetaCredito

import ar.edu.clientesTarjetaCredito.Cliente

class ClientePosta implements Cliente {
	
	@Property int saldo
	
	new() {
		saldo = 0
	}
	
	new(int unSaldo) {
		saldo = unSaldo
	}
	
	override comprar(int monto) {
		saldo = saldo - monto
	}
	
	override pagarVencimiento(int monto) {
		saldo = saldo + monto
	}
	
	override esMoroso() {
		saldo > 0
	}
	
	override getPuntos() {
		0
	}
	
}