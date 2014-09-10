package org.uqbar.comunicacion.exceptions

import org.uqbar.comunicacion.Asiento
import org.uqbar.comunicacion.Sala
import org.uqbar.comunicacion.NoHayLugarException
import org.uqbar.comunicacion.YaEmpezoLaFuncionException
import static extension org.uqbar.comunicacion.Extensions.*

class Acomodador {
	@Property var Sala sala

	def reservar() {
		if (sala.estaEmpezada) throw new YaEmpezoLaFuncionException
		
		val asientoElegido = elegirAsiento(sala.asientosLibres)
		sala.ocupar(asientoElegido)
		asientoElegido
	}

	def elegirAsiento(Iterable<Asiento> asientosLibres) {
		if (asientosLibres.empty) throw new NoHayLugarException
		
		asientosLibres.anyOne
	}

	def cancelar(Asiento aCancelar) {
		sala.liberar(aCancelar)
	}
}
