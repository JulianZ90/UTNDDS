package ar.edu.clientesTarjetaCredito

import ar.edu.clientesTarjetaCredito.Cliente

class ClientePosta implements Cliente {
	
	int saldo
	
	new() {
		saldo = 0
	}
	
	override comprar(int monto) {
		saldo = saldo - monto
	}
	
	override pagarVencimiento(int monto) {
		// TODO: Implementar
	}
	
}