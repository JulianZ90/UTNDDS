package org.uqbar.comunicacion

import java.util.List
import org.uqbar.comunicacion.Asiento

class Sala {
	@Property
	var List<Asiento> asientos = asientosIniciales

	@Property
	var boolean estaEmpezada = false

	def static asientosIniciales() {
		(1 .. 100).map[Asiento.libre].toList
	}

	def asientosLibres() {
		asientos.filter[it.estaLibre]
	}

	def comienzaLaFuncion(Sala sala) {
		sala.estaEmpezada = true
	}

	def ocupar(Asiento asiento) {
		asiento.estaOcupado = true
	}

	def liberar(Asiento asiento) {
		asiento.estaOcupado = false
	}

}
