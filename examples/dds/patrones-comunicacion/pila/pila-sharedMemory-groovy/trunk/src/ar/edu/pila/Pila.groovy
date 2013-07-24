package ar.edu.pila

class Pila {

	def valores = []
	
	/**
	 * Constructor público
	 */
	public Pila() {
		
	}
	
	/** Poner o sacar elementos de la pila */
	def poner(valor) {
		valores.push(valor)
	}
	
	def sacar() {
		valores.pop()
	}

	String toString() {
		"Pila | " + valores
	}
	
	def tope() {
		if (valores) {
			valores.last()
		} else {
			null
		}
	}

}
