package org.uqbar.comunicacion.callReturn

import java.util.ArrayList
import java.util.List
import org.junit.Before
import org.junit.Test
import org.uqbar.comunicacion.sharedMemory.shared.SAsiento

import static org.junit.Assert.*

class AcomodadorCallReturnTest {
	var List<SAsiento> asientos
	
	@Before
	def setUp(){
		asientos = new ArrayList()
		(1..100).forEach[i| asientos += SAsiento.libre ]
	}
	
	@Test
	def testReservarUnAsiento(){
		asientos.forEach[unAsiento | assertFalse(unAsiento.estaOcupado)]
		var asiento = CAcomodador.reservar(asientos)
		assertTrue(asiento.estaOcupado)
	}
	
	@Test
	def testCancelarAsientoReservado(){
		asientos.forEach[unAsiento | assertFalse(unAsiento.estaOcupado)]
		var asiento = CAcomodador.reservar(asientos)
		assertTrue(asiento.estaOcupado)
		
		CAcomodador.cancelar(asientos, asiento)
		assertFalse(asiento.estaOcupado)
		asientos.forEach[unAsiento | assertFalse(unAsiento.estaOcupado)]
	}
	
}