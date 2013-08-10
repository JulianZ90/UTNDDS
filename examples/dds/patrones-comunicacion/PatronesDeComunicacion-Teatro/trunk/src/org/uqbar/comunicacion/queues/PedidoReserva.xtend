package org.uqbar.comunicacion.queues

import org.uqbar.comunicacion.NotificadorReserva

class PedidoReserva {
	@Property int cantidadAReservar
	@Property NotificadorReserva notificador

	new(int cantidadAReservar, NotificadorReserva notificador) {
		this.cantidadAReservar = cantidadAReservar
		this.notificador = notificador
	}
}
