package org.uqbar.comunicacion.continuations

import java.util.ArrayList
import java.util.List
import org.uqbar.comunicacion.Asiento
import org.uqbar.comunicacion.NoHayLugarException
import org.uqbar.comunicacion.NotificadorReserva
import org.uqbar.comunicacion.Sala
import static extension org.uqbar.comunicacion.Extensions.*

class Acomodador {
	@Property var Sala sala

	def reservar(int cantidadAReservar, NotificadorReserva notificador) {
		if (sala.estaEmpezada) {
			notificador.empezoLaFuncion
			return
		}

		val asientosReservados = new ArrayList<Asiento>
		while (asientosReservados.size < cantidadAReservar) {
			try {
				val asientoElegido = sala.asientosLibres.anyOne
				sala.ocupar(asientoElegido)
				asientosReservados += asientoElegido
			}
			catch (NoHayLugarException ex) {
				notificador.lugarInsuficiente(asientosReservados)
				return
			} 
		}

		notificador.seReservaronAsientos(asientosReservados)
	}

	def elegirAsiento(Iterable<Asiento> asientosLibres) {
		if(asientosLibres.empty) throw new NoHayLugarException
		asientosLibres.anyOne
	}

	def cancelar(List<Asiento> asientosReservados) {
		asientosReservados.forEach[sala.liberar(it)]
	}
}
