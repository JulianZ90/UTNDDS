package org.uqbar.comunicacion.callReturn.objects

import org.uqbar.comunicacion.Asiento
import org.uqbar.comunicacion.Sala
import static extension org.uqbar.comunicacion.Extensions.*

class Acomodador {
	def static reservar(Sala sala) {
		val asientoElegido = sala.asientosLibres.anyOne
		asientoElegido.estaOcupado = true
		asientoElegido
	}

	def static cancelar(Asiento aCancelar) {
		// ¿Debo recibir la sala por parámetro o no?
		aCancelar.estaOcupado = false
	}
}
