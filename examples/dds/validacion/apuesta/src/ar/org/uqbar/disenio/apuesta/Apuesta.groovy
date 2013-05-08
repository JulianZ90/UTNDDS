package ar.org.uqbar.disenio.apuesta

class Apuesta {
	
	def dado = new Dado();
	
	/**
	 * Espera una lista de números en el orden en que tiene que salir 
	 * los dados. devuelve la cantidad de veces que acertó.
	 * @param numeros
	 * @return
	 */
	int apostar(numeros) {		
		numeros.count({it == dado.tirar()});
	}
	
}
