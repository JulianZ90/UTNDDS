package ar.edu.vehiculos

class Auto {

	int distanciaRecorrida 
	
	public Auto() {
		distanciaRecorrida = 0
	}
	
	def avanzar() {
		distanciaRecorrida = distanciaRecorrida + 10
	}
	
	def chocarCon(otroVehiculo) {
		println("Chocamos")
	}
	
	def chocarCon(Avion unAvion) {
		unAvion.chocarCon(this)
	}
	
}
