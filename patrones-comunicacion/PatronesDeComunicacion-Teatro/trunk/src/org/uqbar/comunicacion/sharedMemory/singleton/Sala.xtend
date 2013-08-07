package org.uqbar.comunicacion.sharedMemory.singleton

import java.util.List

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
	
}