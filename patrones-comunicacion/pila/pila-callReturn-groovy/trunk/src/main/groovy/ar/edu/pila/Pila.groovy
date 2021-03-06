package ar.edu.pila

class Pila {

	def valores = []

	/** Constante que permite definir una pila vacía */
	public static empty = new Pila()
	
	/** Constructores privados */
	private Pila() {
			
	}
	
	private Pila(valores) {
		this.valores = valores
	}
	
	/** Poner o sacar elementos de la pila */
	def poner(valor) {
		new Pila(valores + valor)
	}
	
	def sacar() {
		new Pila(valores - tope())
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
