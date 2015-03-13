package ar.edu.vehiculos

class Avion {
	
	def avanzar() {
		println("Avanza avion!")
	}
	
	def chocarCon(otroVehiculo) {
		throw new RuntimeException("Imposible probabilisticamente")
	}

}
