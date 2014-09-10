package org.uqbar.comunicacion.sharedMemory.singleton

import org.uqbar.comunicacion.Asiento
import static extension org.uqbar.comunicacion.Extensions.*

class Acomodador {
	def static reservar() {
		val asientoElegido = Sala.instance.asientosLibres.anyOne
		asientoElegido.estaOcupado = true
		asientoElegido
	}

	def static cancelar(Asiento aCancelar) {
		aCancelar.estaOcupado = false
	}
}
