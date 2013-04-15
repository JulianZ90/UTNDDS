package ar.edu.clientesTarjetaCredito

import ar.edu.clientesTarjetaCredito.ClienteDecorator

class ClientePromocionDecorator extends ClienteDecorator {
	int puntosAcumulados
	static int MONTO_MINIMO = 50
	static int PUNTOS_PROMOCION = 15

	new(Cliente decorado) {
		super(decorado)
		puntosAcumulados = 0
	}
	
	override comprar(int monto) {
		decorado.comprar(monto)
		if (monto > MONTO_MINIMO) {
			puntosAcumulados = puntosAcumulados + PUNTOS_PROMOCION
		}
	}
	
}