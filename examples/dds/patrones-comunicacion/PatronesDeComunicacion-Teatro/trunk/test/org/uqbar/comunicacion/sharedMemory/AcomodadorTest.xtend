package org.uqbar.comunicacion.sharedMemory

import org.junit.Test
import org.uqbar.comunicacion.sharedMemory.shared.Funcion

import static org.junit.Assert.*

class AcomodadorTest {
	
	@Test
	def testReservarUnAsiento(){
		var reservado = Acomodador.reservar
		assertTrue(reservado.estaOcupado)
	}
	
	
	@Test
	def testCancelarAsientoReservado(){
		Funcion.instance.asientos.forEach[unAsiento | assertFalse(unAsiento.estaOcupado)]
		var reservado = Acomodador.reservar
		Acomodador.cancelar(reservado)
		assertFalse(reservado.estaOcupado) 
	}
}