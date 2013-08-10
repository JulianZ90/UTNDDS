package org.uqbar.comunicacion.callReturn.objects

import org.uqbar.comunicacion.Asiento
import org.uqbar.comunicacion.Sala

class Acomodador {
	def static reservar(Sala sala) {
		if (sala.estaEmpezada) {
			return null
		}

		val asientoLibre = sala.asientos.findFirst[unAsiento|! unAsiento.isEstaOcupado]
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
