package ar.edu.examenes

import java.util.ArrayList
import java.util.HashSet
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ItemExamenMultiple extends ItemExamen {
	
	Set<Respuesta> respuestas
	
	new() {
		respuestas = new HashSet
	}

	def void agregarRespuesta(Respuesta respuesta) {
		respuestas.add(respuesta)
	}

	override respuestasRespondidas() {
		new ArrayList(respuestas)
	}

	override valor() {
		throw new UnsupportedOperationException("Auto-generated function stub")
	}
	
}