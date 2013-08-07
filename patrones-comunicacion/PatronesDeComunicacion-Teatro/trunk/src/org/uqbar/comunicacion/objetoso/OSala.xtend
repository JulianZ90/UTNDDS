package org.uqbar.comunicacion.objetoso

import java.util.List

class OSala {
	
	@Property
	List<OAsiento> asientos = asientosIniciales
	
	@Property
	boolean estaEmpezada = false
	
	def static asientosIniciales (){
		(1..100).map[ OAsiento.libre ].toList
	}
	
	def reservar(){
		if( estaEmpezada){ return null }
		
		val asientoLibre = asientos.findFirst[unAsiento | unAsiento.estaLibre]
		asientoLibre.reservar
		return asientoLibre
	}
	
	def cancelar(OAsiento aCancelar){
		aCancelar.liberar
	}
	
	def comienzaLaFuncion(){
		estaEmpezada = true
	}
}