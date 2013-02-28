package ar.edu.examenes

class ItemExamenSimple extends ItemExamen {
	
	@Property Respuesta respuestaContestada
	
	new(Object valor) {
		respuestaContestada = new Respuesta(valor)	
	}
	
	override valor() {
		respuestaContestada.valor
	}

	override respuestasRespondidas() {
		throw new UnsupportedOperationException("Auto-generated function stub")
	}
	
}