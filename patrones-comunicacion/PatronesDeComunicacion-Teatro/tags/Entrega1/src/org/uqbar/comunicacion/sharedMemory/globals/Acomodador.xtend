package org.uqbar.comunicacion.sharedMemory.globals

import org.uqbar.comunicacion.Asiento
import static extension org.uqbar.comunicacion.Extensions.*

class Acomodador {
	def static reservar() {
		val asientosLibres = Sala.asientos.filter[it.estaLibre]
		val asientoElegido = asientosLibres.anyOne
		asientoElegido.estaOcupado = true
		asientoElegido
	}

	def static cancelar(Asiento aCancelar) {
		aCancelar.estaOcupado = false
	}
}
