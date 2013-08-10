package org.uqbar.comunicacion.sharedMemory.abuse

import java.util.ArrayList
import java.util.List
import org.uqbar.comunicacion.Asiento
import org.uqbar.comunicacion.NoHayLugarException
import org.uqbar.comunicacion.Sala
import org.uqbar.comunicacion.YaEmpezoLaFuncionException
import static extension org.uqbar.comunicacion.Extensions.*

class Acomodador {
	@Property var Sala sala
	@Property int cantidadAReservar
	@Property List<Asiento> asientosReservados

	def reservar() {
		if (sala.estaEmpezada) {
			throw new YaEmpezoLaFuncionException
		}

		asientosReservados = new ArrayList

		while (asientosReservados.size < cantidadAReservar) {
			val asientoElegido = elegirAsiento(sala.asientosLibres)
			sala.ocupar(asientoElegido)
			asientosReservados += asientoElegido
		}
	}

	def elegirAsiento(Iterable<Asiento> asientosLibres) {
		if(asientosLibres.empty) throw new NoHayLugarException
		asientosLibres.anyOne
	}

	def cancelar(Asiento aCancelar) {
		sala.liberar(aCancelar)
	}
}
