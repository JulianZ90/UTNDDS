package ar.edu.clientesTarjetaCredito

import ar.edu.clientesTarjetaCredito.ClienteDecorator
import ar.edu.clientesTarjetaCredito.exceptions.BusinessException

class SafeShopDecorator extends ClienteDecorator {
	int maximoCompra
	
	new(Cliente decorado, int pMaximoCompra) {
		super(decorado)
		maximoCompra = pMaximoCompra
	}
	
	override comprar(int monto) {
		if (monto > maximoCompra) {
			throw new BusinessException("El monto excede el máximo permitido")
		}
		decorado.comprar(monto)
	}
	
}