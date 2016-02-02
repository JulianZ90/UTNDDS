package edu.utn.frba.extend.excepciones

class NoTienePuntosSuficientesException extends RuntimeException {
	
	private String message
	
	new(String msg) {
		this.message = msg
	}

}