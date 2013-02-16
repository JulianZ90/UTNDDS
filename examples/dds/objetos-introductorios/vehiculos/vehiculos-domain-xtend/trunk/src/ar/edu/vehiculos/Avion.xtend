package ar.edu.vehiculos

import ar.edu.vehiculos.Vehiculo

class Avion implements Vehiculo {
	

	override avanzar() {
		println("Avanza avion!")
	}
	
	override chocar(Vehiculo vehiculo) {
		throw new Exception("Imposible chocar con un avion")
	}
	
}