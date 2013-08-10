package org.uqbar.comunicacion.objetoso

import org.uqbar.comunicacion.Asiento

class Acomodador {
	def static reservar(Sala sala) {
		if (sala.estaEmpezada) {
			return null
		}

		val asientoLibre = sala.asientos.findFirst[unAsiento|! unAsiento.estaOcupado]
		asientoLibre.estaOcupado = true
		return asientoLibre
	}

	def static cancelar(Asiento aCancelar) {
		aCancelar.estaOcupado = false
	}

	def static comienzaLaFuncion(Sala sala) {
		sala.estaEmpezada = true
	}

}
