package org.uqbar.comunicacion.sharedMemory.singleton

import java.util.ArrayList
import java.util.List

class Sala {
	var static Sala instance
	@Property
	var List<Asiento> asientos = new ArrayList
	
	@Property
	var boolean estaEmpezada
	
	public static def getInstance(){
		 if(instance == null){
		 	instance = new Sala 
		 }
		 return instance
	}
	
	new (){
		(1..100).forEach[i| asientos += Asiento.libre ]
		estaEmpezada = false
	}
	
	
}