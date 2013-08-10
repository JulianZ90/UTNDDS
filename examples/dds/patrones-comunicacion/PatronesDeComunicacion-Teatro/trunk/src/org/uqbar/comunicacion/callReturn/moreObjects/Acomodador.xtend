package org.uqbar.comunicacion.callReturn.moreObjects

import org.uqbar.comunicacion.Asiento
import org.uqbar.comunicacion.NoHayLugarException
import org.uqbar.comunicacion.Sala

import static extension org.uqbar.comunicacion.Extensions.*

class Acomodador {
	@Property var Sala sala

	def reservar(PedidoReserva pedido) {
		if (sala.estaEmpezada) {
			pedido.estado = EstadoPedido.EmpezoLaFuncion
			return
		}

		while (pedido.cantReservadas < pedido.cantidadAReservar) {
			try {
				val asientoElegido = elegirAsiento(sala.asientosLibres)
				sala.ocupar(asientoElegido)
				pedido.asientosReservados += asientoElegido
			} catch (NoHayLugarException ex) {

				// cancelar(pedido)
				pedido.estado = EstadoPedido.NoHayLugar
				return
			}
		}
		pedido.estado = EstadoPedido.Reservado
	}

	def elegirAsiento(Iterable<Asiento> asientosLibres) {
		if(asientosLibres.empty) throw new NoHayLugarException
		asientosLibres.anyOne
	}

	def cancelar(PedidoReserva pedido) {
		pedido.asientosReservados.forEach[sala.liberar(it)]
		pedido.estado = EstadoPedido.Cancelado
	}
}
