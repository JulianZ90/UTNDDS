package ar.org.uqbar.disenio.apuesta

class Dado {
	
	Random random = new Random()
	
	def tirar() {
		random.nextInt(6) + 1
	}
	
	
}
