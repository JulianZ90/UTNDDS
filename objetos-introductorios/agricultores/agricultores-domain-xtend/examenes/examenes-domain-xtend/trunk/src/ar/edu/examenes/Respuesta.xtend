package ar.edu.examenes

import org.eclipse.xtend.lib.Property
import java.util.List
import java.util.ArrayList

class Respuesta {
	
	@Property Object valor
	
	new(Object v) {
		valor = v
	}
	
	def List respuestas() {
		var result = new ArrayList<Object>()
		result.add(valor)
		result
	}
	
}