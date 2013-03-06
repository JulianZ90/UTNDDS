package ar.edu.agricultores

import org.junit.Before
import org.junit.Test
import org.junit.Assert

class TestAgricultor {
	
	Agricultor deangeli
	
	@Before
	def void init() {
		deangeli = new Agricultor
		deangeli.agregarParcela(new Parcela(15, new Trigo))
		deangeli.agregarParcela(new Parcela(50, new Soja))
		deangeli.agregarParcela(new Parcela(200, new Trigo))
	}
	
	@Test
	def void testCultivosDeAgricultor() {
		println("Estos son: " + deangeli.cultivos)
		Assert::assertEquals(2, deangeli.cultivos.size)
	}
}