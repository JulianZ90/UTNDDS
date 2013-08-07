package org.uqbar.comunicacion.callReturn

import java.util.List
import org.uqbar.comunicacion.sharedMemory.shared.SAsiento

class CAcomodador {
	
	def static reservar(List<SAsiento> asientos){
		val asientoLibre = asientos.findFirst[unAsiento | ! unAsiento.estaOcupado ]
		asientoLibre.estaOcupado = true
		return asientoLibre
	}
	
	def static cancelar(List<SAsiento> asientos, SAsiento aCancelar){
		aCancelar.estaOcupado = false
	}
	
}