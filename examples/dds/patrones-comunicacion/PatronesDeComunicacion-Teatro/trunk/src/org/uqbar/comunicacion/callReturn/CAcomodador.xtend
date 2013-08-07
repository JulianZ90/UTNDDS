package org.uqbar.comunicacion.callReturn

import java.util.List
import org.uqbar.comunicacion.sharedMemory.singleton.Asiento

class CAcomodador {
	
	def static reservar(List<Asiento> asientos){
		val asientoLibre = asientos.findFirst[unAsiento | ! unAsiento.estaOcupado ]
		asientoLibre.estaOcupado = true
		return asientoLibre
	}
	
	def static cancelar(List<Asiento> asientos, Asiento aCancelar){
		aCancelar.estaOcupado = false
	}
	
}