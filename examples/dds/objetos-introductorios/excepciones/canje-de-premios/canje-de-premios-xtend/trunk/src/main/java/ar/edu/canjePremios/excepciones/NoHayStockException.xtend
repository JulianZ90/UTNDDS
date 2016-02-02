package ar.edu.canjePremios.excepciones

class NoHayStockException extends RuntimeException {

	var String message
	var Exception cause
	
	new(String msg, Exception exception) {
		message = msg
		cause = exception	
	}

}
