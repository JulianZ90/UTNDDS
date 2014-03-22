package ar.edu.agricultores


import org.junit.Before
import org.junit.Test
import org.junit.Assert

class TestAgricultor {
	
	Agricultor deangeli
	ReporteadorAgricultores repoDeAngeli
	
	@Before
	def void init() {
		deangeli = new Agricultor
		deangeli.agregarParcela(new Parcela(15, new Trigo))
		deangeli.agregarParcela(new Parcela(50, new Soja))
		deangeli.agregarParcela(new Parcela(200, new Trigo))
		repoDeAngeli = new ReporteadorAgricultores
	}

	// PUNTO 4
		
	@Test
	def void testCultivosDeAgricultor() {
		Assert.assertEquals(2, repoDeAngeli.cultivos(deangeli).size)
	}
	
}