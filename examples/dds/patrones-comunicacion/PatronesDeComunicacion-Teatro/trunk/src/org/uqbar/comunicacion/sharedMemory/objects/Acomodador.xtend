package org.uqbar.comunicacion.sharedMemory.objects

import org.uqbar.comunicacion.Asiento
import org.uqbar.comunicacion.Sala

class Acomodador {
	@Property var Sala sala
	
	def reservar() {
		if (sala.estaEmpezada) {
			return null
		}

		val asientoLibre = sala.asientos.findFirst[unAsiento|! unAsiento.isEstaOcupado]
		asientoLibre.estaOcupado = true
		return asientoLibre
	}

	def cancelar(Asiento aCancelar) {
		aCancelar.estaOcupado = false
	}

	def comienzaLaFuncion(Sala sala) {
		sala.estaEmpezada = true
	}

}
