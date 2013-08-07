package org.uqbar.comunicacion.sharedMemory

import org.junit.Test
import org.uqbar.comunicacion.sharedMemory.shared.Sala

import static org.junit.Assert.*

class AcomodadorTest {
	
	@Test
	def testReservarUnAsiento(){
		Sala.instance.asientos.forEach[unAsiento | assertFalse(unAsiento.estaOcupado)]
		var reservado = Acomodador.reservar
		assertNotNull(reservado.estaOcupado)
		assertTrue(reservado.estaOcupado)
	}
	
	@Test
	def testCancelarAsientoReservado(){
		Sala.instance.asientos.forEach[unAsiento | assertFalse(unAsiento.estaOcupado)]
		var reservado = Acomodador.reservar
		
		Acomodador.cancelar(reservado)
		assertFalse(reservado.estaOcupado) 
	}
	
	@Test
	def testArrancarLaFuncionLaDejaEmpezada(){
		assertFalse(Sala.instance.estaEmpezada)		
		Acomodador.comienzaLaFuncion()
		assertTrue(Sala.instance.estaEmpezada)
	}
	
	@Test
	def testNoSePuedenReservarEntradasEmpezadaLaFuncion(){
		assertFalse(Sala.instance.estaEmpezada)		
		Acomodador.comienzaLaFuncion()
		assertTrue(Sala.instance.estaEmpezada)
		
		assertNull(Acomodador.reservar)
	}
}