package org.uqbar.comunicacion.sharedMemory.globals

import org.uqbar.comunicacion.Asiento

class Acomodador {
	def static reservar() {
		if (Sala.empezoLaFuncion) {
			return null
		}

		val asientoLibre = Sala.asientos.findFirst[unAsiento|!unAsiento.estaOcupado]
		asientoLibre.estaOcupado = true
		return asientoLibre
	}

	def static cancelar(Asiento aCancelar) {
		aCancelar.estaOcupado = false
	}
}
