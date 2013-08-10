package org.uqbar.comunicacion.queues

import java.util.ArrayList
import java.util.LinkedList
import java.util.List
import java.util.Queue
import org.uqbar.comunicacion.Asiento
import org.uqbar.comunicacion.NotificadorReserva
import org.uqbar.comunicacion.Sala

class PedidoReserva {
	@Property int cantidadAReservar
	@Property NotificadorReserva notificador

	new(int cantidadAReservar, NotificadorReserva notificador) {
		this.cantidadAReservar = cantidadAReservar
		this.notificador = notificador
	}
}

class Acomodador {
	@Property Sala sala
	@Property Queue<PedidoReserva> queue = new LinkedList

	def reservar(int cantidadAReservar, NotificadorReserva notificador) {
		queue += new PedidoReserva(cantidadAReservar, notificador)
	}

	def procesarPedidos() {
		queue.forEach[procesarPedido(it)]
	}

	def procesarPedido(PedidoReserva pedido) {
		val asientosReservados = new ArrayList<Asiento>
		while (asientosReservados.size < pedido.cantidadAReservar) {
			val asientoLibre = sala.asientos.findFirst[!it.isEstaOcupado]
			if (asientoLibre == null) {
				pedido.notificador.lugarInsuficiente(asientosReservados)
				return
			}

			asientoLibre.estaOcupado = true
			asientosReservados += asientoLibre
		}

		pedido.notificador.seReservaronAsientos(asientosReservados)

	}

	def cancelar(List<Asiento> asientosReservados) {
		asientosReservados.forEach[it.estaOcupado = false]
	}
}
