package org.uqbar.comunicacion.sharedMemory.shared

import java.util.ArrayList
import java.util.List

class Funcion {
	var static Funcion instance
	@Property
	var List<Asiento> asientos = new ArrayList
	
	public static def getInstance(){
		 if(instance == null){
		 	instance = new Funcion 
		 }
		 return instance
	}
	
	new (){
		(1..100).forEach[i| asientos += Asiento.libre ]
	}
	
	
}