package org.uqbar.comunicacion.exceptions

import org.junit.Before
import org.junit.Test
import org.uqbar.comunicacion.Sala
import org.uqbar.comunicacion.YaEmpezoLaFuncionException
import java.util.ArrayList
import org.uqbar.comunicacion.NoHayLugarException
import static org.junit.Assert.*

class AcomodadorExceptionsTest {
	var Sala sala
	var Acomodador acomodador
	
	@Before
	def setup(){
		sala = new Sala
		acomodador = new Acomodador
		acomodador.sala = sala
	}
	
	@Test(expected=YaEmpezoLaFuncionException)
	def void testNoSePuedeReservarSiYaEmpezoLaFuncion(){
		sala.comienzaLaFuncion(sala)
		acomodador.reservar
	}
	
	@Test(expected=NoHayLugarException)
	def void testNoSePuedeReservarSiNoHayAsientos(){
		sala.asientos = new ArrayList;
		acomodador.reservar
	}
	
	@Test
	def testReservarUnAsientoLoDejaOcupado() {
		var reserva = acomodador.reservar
		assertTrue(reserva.estaOcupado)
	}

	@Test
	def testCancelarAsientoReservadoLoDejaLibre() {
		var asiento = acomodador.reservar
		assertTrue(asiento.estaOcupado)

		acomodador.cancelar(asiento)
		assertFalse(asiento.estaOcupado)
	}
	
}