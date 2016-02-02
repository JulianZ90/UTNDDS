package ar.edu.vehiculos

import org.junit.Before
import org.junit.Test

class TestVehiculo {
	
	Vehiculo boeing
	Vehiculo fitito
	Vehiculo fierrito
	
	@Before
	def void setUp() throws Exception {
		boeing = new Avion()
		fitito = new Auto()
		fierrito = new Auto()
	}

	@Test
	def void testAvanzarFitito() {
		fitito.avanzar()
	}

	@Test
	def void testChocarFititoConFierrito() {
		fitito.chocar(fierrito)
	}
	
	@Test(expected=typeof(Exception))
	def void testChocarBoeingConFitito() {
		boeing.chocar(fitito)
	}
	
}