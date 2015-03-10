package ar.edu.examenes

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Pregunta {
	
	String descripcion

	def boolean bienRespondida(ItemExamen itemExamen) {
		false	
	}	
	
	override String toString() {
		"Pregunta: " + descripcion
	}
		
}