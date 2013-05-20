package ar.edu.microprocesador.creationals

import ar.edu.microprocesador.instrucciones.Instruccion
import java.util.Iterator
import java.util.List

class ProgramIterator implements Iterator<Instruccion> {

	List<Byte> programMemory
	byte index
	
	new(List<Byte> program) {
		programMemory = program
		index = 0 as byte
	}
	
	override hasNext() {
		codigoInstruccionActual > 0
	}

	def byte codigoInstruccionActual() {
		programMemory.get(index)
	}
	
	override remove() {
		throw new UnsupportedOperationException("remove - Program Iterator")
	}

	override next() {
		val valorActual = codigoInstruccionActual
		this.advanceIndex()
		InstruccionFactory::instance.getInstruction(valorActual, this)
	}

	def void advanceIndex() {
		index = (index + 1) as byte
	}
	
	def byte nextValue() {
		val valorActual = codigoInstruccionActual
		this.advanceIndex()
		valorActual
	}

}