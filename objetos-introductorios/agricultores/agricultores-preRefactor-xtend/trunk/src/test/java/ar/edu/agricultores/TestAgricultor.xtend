package ar.edu.agricultores

import org.junit.Before
import org.junit.Test
import org.junit.Assert

class TestAgricultor {

	Agricultor deangeli
	Agricultor mendiguren
	ReporteadorAgricultores reporter

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
		reporter = new ReporteadorAgricultores
	}

	// PUNTO 4
	@Test
	def void testCultivosDeAgricultor() {
		Assert.assertEquals(2, reporter.cultivos(deangeli).size)
	}

	@Test
	def void testAgricultorSinParcelasSubutilizadas() {
		Assert.assertFalse(reporter.algunaParcelaSubutilizada(deangeli))
	}

	@Test
	def void testAgricultorConParcelasSubutilizadas() {
		Assert.assertTrue(reporter.algunaParcelaSubutilizada(mendiguren))
	}

}
