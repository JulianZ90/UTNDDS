package ar.edu.agricultores

import org.junit.Before
import org.junit.Test
import org.junit.Assert

class TestAgricultor {

	// ESTE TEST DEBIO REFACTORIZARSE
	// YA QUE ANTES UTILIZABAMOS UN REPORTEADOR DE AGRICULTORES 
	
	Agricultor deangeli
	Agricultor mendiguren

	@Before
	def void init() {
		deangeli = new Agricultor
		deangeli.agregarParcela(new Parcela(15, new Trigo))
		deangeli.agregarParcela(new Parcela(50, new Soja))
		deangeli.agregarParcela(new Parcela(200, new Trigo))
		mendiguren = new Agricultor
		mendiguren.agregarParcela(new Parcela(15, new SojaTransgenica(true)))
		val parcelaMendigurenConTrigo = new Parcela(20, new Trigo)
		parcelaMendigurenConTrigo.hectareas = 700
		mendiguren.agregarParcela(parcelaMendigurenConTrigo)
	}

	// PUNTO 4
	@Test
	def void testCultivosDeAgricultor() {
		Assert.assertEquals(2, deangeli.cultivos.size)
	}

	@Test
	def void testAgricultorSinParcelasSubutilizadas() {
		Assert.assertFalse(deangeli.algunaParcelaSubutilizada)
	}

	@Test
	def void testAgricultorConParcelasSubutilizadas() {
		Assert.assertTrue(mendiguren.algunaParcelaSubutilizada)
	}

}
