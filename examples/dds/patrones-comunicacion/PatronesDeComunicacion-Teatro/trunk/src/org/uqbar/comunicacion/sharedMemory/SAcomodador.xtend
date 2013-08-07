package org.uqbar.comunicacion.sharedMemory

import org.uqbar.comunicacion.sharedMemory.shared.SFuncion

class SAcomodador {
	
	def static reservar(){
		val asientoLibre = SFuncion.instance.asientos.findFirst[unAsiento | ! unAsiento.estaOcupado ]
		asientoLibre.estaOcupado = true
		SFuncion.instance.ultimoAsientoReservado = asientoLibre
	}
	
	def static cancelar(){
		SFuncion.instance.asientoACancelar.estaOcupado = false
	}
	
}