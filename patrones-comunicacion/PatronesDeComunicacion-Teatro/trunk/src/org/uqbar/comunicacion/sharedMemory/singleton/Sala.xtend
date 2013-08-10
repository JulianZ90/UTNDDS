package org.uqbar.comunicacion.sharedMemory.singleton

import java.util.List
import org.uqbar.comunicacion.Asiento

class Sala {
	var static Sala instance
	
	@Property
	var List<Asiento> asientos = asientosIniciales
	
	@Property
	var boolean estaEmpezada = false
	
	public static def getInstance(){
		 if(instance == null){
		 	instance = new Sala 
		 }
		 return instance
	}
	
	def static asientosIniciales (){
		(1..100).map[ Asiento.libre ].toList
	}
	
	def asientosLibres() {
		asientos.filter[it.estaLibre]
	}

	def comienzaLaFuncion() {
		instance.estaEmpezada = true
	}
}