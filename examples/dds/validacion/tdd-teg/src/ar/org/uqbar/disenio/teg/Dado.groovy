package ar.org.uqbar.disenio.teg

class Dado {
	
	Random random = new Random()
	
	def tirar() {
		random.nextInt(6) + 1
	}
	
	
}
