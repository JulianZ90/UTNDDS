package org.uqbar.comunicacion.sharedMemory.shared

class Asiento {
	@Property boolean estaOcupado
	
	def static libre() {
		val asiento = new Asiento 
		asiento.estaOcupado = false
		asiento
	}
	
}