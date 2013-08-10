package org.uqbar.comunicacion.continuations

import java.util.ArrayList
import java.util.List
import org.uqbar.comunicacion.Asiento
import org.uqbar.comunicacion.Sala

class Acomodador {
	@Property var Sala sala

	def reservar(int cantidadAReservar, NotificadorReserva notificador) {
		if (sala.estaEmpezada) {
			notificador.empezoLaFuncion
			return
		}

		val asientosReservados = new ArrayList<Asiento>
		while (asientosReservados.size < cantidadAReservar) {
			val asientoLibre = sala.asientos.findFirst[!it.isEstaOcupado]
			if (asientoLibre == null) {
				notificador.lugarInsuficiente(asientosReservados)
				return
			}

			asientoLibre.estaOcupado = true
			asientosReservados += asientoLibre
		}

		notificador.seReservaronAsientos(asientosReservados)
	}

	def cancelar(List<Asiento> asientosReservados) {
		asientosReservados.forEach[it.estaOcupado = false]
	}
}
