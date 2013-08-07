package org.uqbar.comunicacion.objetoso

class OAsiento {
	@Property boolean estaOcupado
	
	def static libre() {
		val asiento = new OAsiento 
		asiento.estaOcupado = false
		asiento
	}
	
	def liberar(){
		estaOcupado = false
	}
	
	def reservar(){
		estaOcupado = true
	}
	
	def estaLibre(){
		!estaOcupado
	}
}