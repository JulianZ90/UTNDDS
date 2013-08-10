package org.uqbar.comunicacion.sharedMemory.abuse

import java.util.ArrayList
import java.util.List
import org.uqbar.comunicacion.Asiento
import org.uqbar.comunicacion.NoHayLugarException
import org.uqbar.comunicacion.Sala
import org.uqbar.comunicacion.YaEmpezoLaFuncionException

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
			val asientoLibre = sala.asientos.findFirst[!it.isEstaOcupado]
			if (asientoLibre == null) {
				throw new NoHayLugarException
			}
			asientoLibre.estaOcupado = true
			asientosReservados += asientoLibre
		}
	}

	def cancelar(Asiento aCancelar) {
		aCancelar.estaOcupado = false
	}

	def comienzaLaFuncion(Sala sala) {
		sala.estaEmpezada = true
	}
}
