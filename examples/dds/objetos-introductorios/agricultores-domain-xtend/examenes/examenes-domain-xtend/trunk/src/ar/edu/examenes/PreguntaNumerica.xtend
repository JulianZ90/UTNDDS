package ar.edu.examenes

import ar.edu.examenes.Pregunta

class PreguntaNumerica extends Pregunta {
	
	@Property Respuesta respuesta
	
	new() {
		
	}
	
	new(Respuesta r) {
		respuesta = r
	}
	
	override boolean bienRespondida(ItemExamen itemExamen) {
		respuesta.valor.equals(itemExamen.valor)	
	}	
	
}