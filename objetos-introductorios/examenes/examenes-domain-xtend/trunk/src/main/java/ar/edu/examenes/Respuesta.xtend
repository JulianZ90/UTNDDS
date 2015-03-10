package ar.edu.examenes

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Respuesta {
	
	Object valor
	
	new(Object v) {
		valor = v
	}
	
	def List respuestas() {
		var result = new ArrayList<Object>()
		result.add(valor)
		result
	}
	
}