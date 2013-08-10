package org.uqbar.comunicacion.objetoso

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

}
