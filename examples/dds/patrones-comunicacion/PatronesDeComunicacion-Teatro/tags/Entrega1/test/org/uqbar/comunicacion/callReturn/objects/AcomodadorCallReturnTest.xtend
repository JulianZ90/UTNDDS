package org.uqbar.comunicacion.callReturn.objects

import org.junit.Test
import org.uqbar.comunicacion.Sala

import static org.junit.Assert.*

class AcomodadorCallReturnTest {
	val sala = new Sala

	@Test
	def testReservarUnAsientoLoDejaOcupado() {
		sala.asientos.forEach[assertTrue(it.estaLibre)]

		var asiento = Acomodador.reservar(sala)
		assertTrue(asiento.estaOcupado)
	}

	@Test
	def testCancelarAsientoReservadoLoDejaLibre() {
		sala.asientos.forEach[assertFalse(it.estaOcupado)]

		var asiento = Acomodador.reservar(sala)
		assertTrue(asiento.estaOcupado)

		Acomodador.cancelar(asiento)
		assertFalse(asiento.estaOcupado)

		sala.asientos.forEach[assertFalse(it.estaOcupado)]
	}

}
