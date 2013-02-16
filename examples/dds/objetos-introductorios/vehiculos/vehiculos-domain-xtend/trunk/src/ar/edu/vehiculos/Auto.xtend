package ar.edu.vehiculos

import ar.edu.vehiculos.Vehiculo

class Auto implements Vehiculo {
	

	override avanzar() {
		println("Avanza auto")
	}
	
	override chocar(Vehiculo vehiculo) {
		println("Chocamosss!!!!")
	}
	
}