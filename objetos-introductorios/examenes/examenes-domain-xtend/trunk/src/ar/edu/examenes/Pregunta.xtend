package ar.edu.examenes

abstract class Pregunta {
	
	@Property String descripcion

	def boolean bienRespondida(ItemExamen itemExamen) {
		false	
	}	
	
	override String toString() {
		"Pregunta: " + descripcion
	}
		
}