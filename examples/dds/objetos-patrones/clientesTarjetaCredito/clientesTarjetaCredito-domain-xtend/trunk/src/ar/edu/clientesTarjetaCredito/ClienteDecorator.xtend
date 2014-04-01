package ar.edu.clientesTarjetaCredito

import ar.edu.clientesTarjetaCredito.Cliente

abstract class ClienteDecorator implements Cliente {
	
	@Property Cliente decorado
	
	new(Cliente cliente) {
		decorado = cliente
	}
	
	override pagarVencimiento(int monto) {
		decorado.pagarVencimiento(monto)
	}
	
	override getPuntos() {
		decorado.puntos
	} 
	
	override getSaldo() {
		decorado.saldo
	}
	
	override esMoroso() {
		saldo > 0
	} 
	
}