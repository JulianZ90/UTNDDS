package org.uqbar.comunicacion.sharedMemory.shared

class SAsiento {
	@Property boolean estaOcupado
	
	def static libre() {
		val asiento = new SAsiento 
		asiento.estaOcupado = false
		asiento
	}
	
}