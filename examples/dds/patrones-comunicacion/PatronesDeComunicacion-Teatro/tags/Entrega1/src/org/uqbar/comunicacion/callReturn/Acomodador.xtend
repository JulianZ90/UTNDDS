package org.uqbar.comunicacion.callReturn

import java.util.List
import org.uqbar.comunicacion.Asiento
import static extension org.uqbar.comunicacion.Extensions.*

class Acomodador {
	def static reservar(List<Asiento> asientos) {
		val asientosLibres = asientos.filter[it.estaLibre]
		val asientoElegido = asientosLibres.anyOne
		asientoElegido.estaOcupado = true
		asientoElegido
	}

	def static cancelar(Asiento aCancelar) {
		aCancelar.estaOcupado = false
	}
}
