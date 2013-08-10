package org.uqbar.comunicacion.sharedMemory.singleton

import org.uqbar.comunicacion.Asiento

class Acomodador {
	def static reservar() {
		if (Sala.instance.estaEmpezada) {
			return null
		}

		val asientoLibre = Sala.instance.asientos.findFirst[unAsiento|! unAsiento.estaOcupado]
		asientoLibre.estaOcupado = true
		return asientoLibre
	}

	def static cancelar(Asiento aCancelar) {
		aCancelar.estaOcupado = false
	}

	def static comienzaLaFuncion() {
		Sala.instance.estaEmpezada = true
	}

}
