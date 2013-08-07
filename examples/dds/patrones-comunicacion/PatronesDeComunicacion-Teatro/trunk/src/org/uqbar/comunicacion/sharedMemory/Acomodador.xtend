package org.uqbar.comunicacion.sharedMemory

import org.uqbar.comunicacion.sharedMemory.shared.Asiento
import org.uqbar.comunicacion.sharedMemory.shared.Funcion

class Acomodador {
	
	def static reservar(){
		val asientoLibre = Funcion.instance.asientos.findFirst[unAsiento | ! unAsiento.estaOcupado ]
		asientoLibre.estaOcupado = true
		return asientoLibre
	}
	
	def static cancelar(Asiento aCancelar){
		aCancelar.estaOcupado = false
	}
	
}