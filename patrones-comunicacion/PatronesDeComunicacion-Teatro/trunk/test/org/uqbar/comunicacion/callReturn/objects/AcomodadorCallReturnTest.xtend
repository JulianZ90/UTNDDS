package org.uqbar.comunicacion.callReturn.objects

import org.junit.Test
import org.uqbar.comunicacion.Sala

import static org.junit.Assert.*

class AcomodadorCallReturnTest {
	var Sala sala = new Sala

	@Test
	def testReservarUnAsiento() {
		sala.asientos.forEach[assertFalse(it.estaOcupado)]

		var asiento = Acomodador.reservar(sala)
		assertTrue(asiento.estaOcupado)
	}

	@Test
	def testCancelarAsientoReservado() {
		sala.asientos.forEach[assertFalse(it.estaOcupado)]

		var asiento = Acomodador.reservar(sala)
		assertTrue(asiento.estaOcupado)

		Acomodador.cancelar(asiento)
		assertFalse(asiento.estaOcupado)

		sala.asientos.forEach[assertFalse(it.estaOcupado)]
	}

}
