package org.uqbar.comunicacion.queues

import java.util.ArrayList
import java.util.LinkedList
import java.util.List
import java.util.Queue
import org.uqbar.comunicacion.Asiento
import org.uqbar.comunicacion.NoHayLugarException
import org.uqbar.comunicacion.NotificadorReserva
import org.uqbar.comunicacion.Sala

import static extension org.uqbar.comunicacion.Extensions.*

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
		if (sala.estaEmpezada) {
			pedido.notificador.empezoLaFuncion
			return
		}

		val asientosReservados = new ArrayList<Asiento>
		while (asientosReservados.size < pedido.cantidadAReservar) {
			try {
				val asientoElegido = sala.asientosLibres.anyOne
				sala.ocupar(asientoElegido)
				asientosReservados += asientoElegido
			}
			catch (NoHayLugarException ex) {
				pedido.notificador.lugarInsuficiente(asientosReservados)
				return
			} 
		}

		pedido.notificador.seReservaronAsientos(asientosReservados)
	}

	def elegirAsiento(Iterable<Asiento> asientosLibres) {
		if(asientosLibres.empty) throw new NoHayLugarException
		asientosLibres.anyOne
	}

	def cancelar(List<Asiento> asientosReservados) {
		asientosReservados.forEach[sala.liberar(it)]
	}
}
