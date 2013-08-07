package org.uqbar.comunicacion.sharedMemory

import org.uqbar.comunicacion.sharedMemory.shared.Asiento
import org.uqbar.comunicacion.sharedMemory.shared.Sala

class Acomodador {
	
	def static reservar(){
		if( Sala.instance.estaEmpezada){ return null }
		
		val asientoLibre = Sala.instance.asientos.findFirst[unAsiento | ! unAsiento.estaOcupado ]
		asientoLibre.estaOcupado = true
		return asientoLibre
	}
	
	def static cancelar(Asiento aCancelar){
		aCancelar.estaOcupado = false
	}
	
}