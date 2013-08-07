package org.uqbar.comunicacion.sharedMemory.globals

import org.uqbar.comunicacion.sharedMemory.singleton.Asiento

import static extension org.uqbar.comunicacion.sharedMemory.globals.GlobalSala.*

class GlobalAcomodador {
	def static reservar(){
		if( GlobalSala.estaEmpezada){ return null }
		
		val asientoLibre = GlobalSala.asientos.findFirst[unAsiento | ! unAsiento.estaOcupado ]
		asientoLibre.estaOcupado = true
		return asientoLibre
	}
	
	def static cancelar(Asiento aCancelar){
		aCancelar.estaOcupado = false
	}
	
	def static comienzaLaFuncion(){
		GlobalSala.estaEmpezada = true
	}
	
}