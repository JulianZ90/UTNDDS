package org.uqbar.comunicacion.dependencyInjection

import org.junit.Before
import org.junit.Test
import org.uqbar.comunicacion.Sala
import org.uqbar.comunicacion.sharedMemory.objects.Acomodador

import static org.junit.Assert.*

class AcomodadorSharedMemoryTest {
	var Acomodador acomodador

	@Before
	def setUp() {
		acomodador = new Acomodador
		acomodador.sala = new Sala
	}

	@Test
	def testReservarUnAsientoLoDejaOcupado() {
		acomodador.sala.asientos.forEach[assertFalse(it.estaOcupado)]

		var asiento = acomodador.reservar
		assertTrue(asiento.estaOcupado)
	}

	@Test
	def testCancelarAsientoReservadoLoDejaLibre() {
		acomodador.sala.asientos.forEach[assertFalse(it.estaOcupado)]

		var asiento = acomodador.reservar
		assertTrue(asiento.estaOcupado)

		acomodador.cancelar(asiento)
		assertFalse(asiento.estaOcupado)

		acomodador.sala.asientos.forEach[assertFalse(it.estaOcupado)]
	}

}
