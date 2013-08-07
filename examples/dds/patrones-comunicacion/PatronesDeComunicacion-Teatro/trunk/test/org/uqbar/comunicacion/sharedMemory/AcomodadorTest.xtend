package org.uqbar.comunicacion.sharedMemory

import org.junit.Test
import org.uqbar.comunicacion.sharedMemory.shared.SFuncion

import static org.junit.Assert.*

class AcomodadorTest {
	
	@Test
	def testReservarUnAsiento(){
		assertNull(SFuncion.instance.ultimoAsientoReservado)
		SAcomodador.reservar
		assertNotNull(SFuncion.instance.ultimoAsientoReservado)
	}
	
	@Test
	def testCancelarAsientoReservado(){
		SAcomodador.reservar
		SFuncion.instance.asientoACancelar = SFuncion.instance.ultimoAsientoReservado
		
		SAcomodador.cancelar
		assertFalse(SFuncion.instance.ultimoAsientoReservado.estaOcupado) 
	}
}