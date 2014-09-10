package org.uqbar.comunicacion.sharedMemory.objects

import org.uqbar.comunicacion.Asiento
import org.uqbar.comunicacion.Sala

import static extension org.uqbar.comunicacion.Extensions.*

class Acomodador {
	@Property var Sala sala

	def reservar() {
		val asientoElegido = elegirAsiento(sala.asientosLibres)
		sala.ocupar(asientoElegido)
		asientoElegido
	}

	def elegirAsiento(Iterable<Asiento> asientosLibres) {
		asientosLibres.anyOne
	}

	def cancelar(Asiento aCancelar) {
		sala.liberar(aCancelar)
	}
}
