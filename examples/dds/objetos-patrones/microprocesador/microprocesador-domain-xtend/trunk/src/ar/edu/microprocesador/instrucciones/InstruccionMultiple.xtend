package ar.edu.microprocesador.instrucciones

import java.util.List
import ar.edu.microprocesador.Microcontroller

class InstruccionMultiple extends Instruccion {
	
	List<Instruccion> instrucciones
	
	new(List<Instruccion> instrucciones) {
		this.instrucciones = instrucciones
	}
	
	override doExecute(Microcontroller micro) {
		instrucciones.forEach [ instruccion | 
			instruccion.doExecute(micro)
		]
		println(micro.toString)
	}
	
}