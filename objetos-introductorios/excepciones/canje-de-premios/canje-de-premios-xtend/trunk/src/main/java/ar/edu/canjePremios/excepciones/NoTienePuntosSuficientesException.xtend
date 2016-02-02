package ar.edu.canjePremios.excepciones

class NoTienePuntosSuficientesException extends RuntimeException {
	
	private String message
	
	new(String msg) {
		this.message = msg
	}

}