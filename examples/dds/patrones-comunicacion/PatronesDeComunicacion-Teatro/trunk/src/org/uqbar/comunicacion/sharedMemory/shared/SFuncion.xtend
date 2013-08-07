package org.uqbar.comunicacion.sharedMemory.shared

import java.util.List
import java.util.ArrayList

class SFuncion {
	var static SFuncion instance
	@Property
	var List<SAsiento> asientos = new ArrayList
	
	@Property
	var SAsiento ultimoAsientoReservado
	
	@Property
	var SAsiento asientoACancelar
	
	public static def getInstance(){
		 if(instance == null){
		 	instance = new SFuncion 
		 }
		 return instance
	}
	
	new (){
		(1..100).forEach[i| asientos += SAsiento.libre ]
	}
	
	
}