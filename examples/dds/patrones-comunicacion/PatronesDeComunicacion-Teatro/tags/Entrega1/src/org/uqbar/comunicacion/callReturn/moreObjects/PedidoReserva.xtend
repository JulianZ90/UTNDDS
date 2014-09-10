package org.uqbar.comunicacion.callReturn.moreObjects

import java.util.ArrayList
import java.util.List
import org.uqbar.comunicacion.Asiento

enum EstadoPedido {
	Pendiente,
	Reservado,
	EmpezoLaFuncion,
	NoHayLugar,
	Cancelado
}

class PedidoReserva {
	@Property int cantidadAReservar
	@Property List<Asiento> asientosReservados = new ArrayList
	@Property EstadoPedido estado = EstadoPedido.Pendiente

	def cantReservadas() {
		asientosReservados.size
	}
}
