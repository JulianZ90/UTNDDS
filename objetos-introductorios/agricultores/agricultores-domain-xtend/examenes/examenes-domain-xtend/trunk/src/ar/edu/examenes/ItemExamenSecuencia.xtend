package ar.edu.examenes

import java.util.List

class ItemExamenSecuencia extends ItemExamen {
	
	@Property List<Respuesta> respuestas
	

	override List respuestasRespondidas() {
		return respuestas
	}
	

	override valor() {
		throw new UnsupportedOperationException("Auto-generated function stub")
	}
	
}