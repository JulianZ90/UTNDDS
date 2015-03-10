package ar.edu.examenes

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class PreguntaNumerica extends Pregunta {
	
	Respuesta respuesta
	
	new() {
		
	}
	
	new(Respuesta r) {
		respuesta = r
	}
	
	override boolean bienRespondida(ItemExamen itemExamen) {
		respuesta.valor.equals(itemExamen.valor)	
	}	
	
}