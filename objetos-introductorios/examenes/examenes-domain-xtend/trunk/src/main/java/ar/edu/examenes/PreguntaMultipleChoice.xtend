package ar.edu.examenes

import java.util.HashSet
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class PreguntaMultipleChoice extends Pregunta {
	
	Set<Respuesta> respuestasCorrectas

	new() {
		descripcion = ""
		respuestasCorrectas = new HashSet()
	}
	
	def agregarRespuestaCorrecta(Respuesta respuestaCorrecta) {
		respuestasCorrectas.add(respuestaCorrecta)
	}	
	
	override boolean bienRespondida(ItemExamen itemExamen) {
		val respondidas = itemExamen.respuestasRespondidas.map [ valor ]
		val correctas = respuestasCorrectas.map [ valor ]
		correctas.forall( [ respondidas.contains(it) ]) 
		// TODO : Falta comprobar que las respondidas están dentro de las correctas
	}
		
}