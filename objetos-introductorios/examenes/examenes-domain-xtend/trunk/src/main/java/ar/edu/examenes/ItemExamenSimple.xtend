package ar.edu.examenes

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ItemExamenSimple extends ItemExamen {
	
	Respuesta respuestaContestada
	
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