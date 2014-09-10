package org.uqbar.comunicacion

class Asiento {
	@Property boolean estaOcupado
	
	def static libre() {
		val asiento = new Asiento 
		asiento.estaOcupado = false
		asiento
	}
	
	def estaLibre() {
		!estaOcupado
	}
}