package org.uqbar.comunicacion.callReturn.moreObjects

import org.uqbar.comunicacion.Sala

class Acomodador {
	@Property var Sala sala

	def reservar(PedidoReserva pedido) {
		if (sala.estaEmpezada) {
			pedido.estado = EstadoPedido.EmpezoLaFuncion
			return
		}

		while (pedido.cantReservadas < pedido.cantidadAReservar) {
			val asientoLibre = sala.asientos.findFirst[!it.isEstaOcupado]
			if (asientoLibre == null) {
				pedido.estado = EstadoPedido.NoHayLugar
				return
			}

			asientoLibre.estaOcupado = true
			pedido.asientosReservados += asientoLibre
		}
		
		pedido.estado = EstadoPedido.Reservado
	}

	def cancelar(PedidoReserva pedido) {
		pedido.asientosReservados.forEach[it.estaOcupado = false]
		pedido.estado = EstadoPedido.Cancelado
	}
}
