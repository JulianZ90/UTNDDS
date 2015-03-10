package ar.edu.examenes

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ItemExamenSecuencia extends ItemExamen {
	
	List<Respuesta> respuestas
	

	override List respuestasRespondidas() {
		return respuestas
	}
	

	override valor() {
		throw new UnsupportedOperationException("Auto-generated function stub")
	}
	
}