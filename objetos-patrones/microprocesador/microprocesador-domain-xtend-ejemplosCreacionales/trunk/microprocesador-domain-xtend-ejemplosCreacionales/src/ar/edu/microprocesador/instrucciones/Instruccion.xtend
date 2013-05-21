package ar.edu.microprocesador.instrucciones

import ar.edu.microprocesador.Microcontroller
import ar.edu.microprocesador.creationals.ProgramIterator
import ar.edu.microprocesador.excepciones.SystemException

abstract class Instruccion implements Cloneable {
	
	Microcontroller microBefore

	def void execute(Microcontroller micro) {
		microBefore = micro.clone as Microcontroller
		this.doExecute(micro)
	}

	def void doExecute(Microcontroller micro)
	
	def void undo(Microcontroller micro) {
		micro.copyFrom(microBefore)
	}

	def void prepare(ProgramIterator programIt) {
		// Por default, no hago nada
	}

	override clone() {
		try {
			super.clone() as Instruccion
		} catch (CloneNotSupportedException e) {
			throw new SystemException("La instruccion " + this + " no es clonable")
		}
	}	
}