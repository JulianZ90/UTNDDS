package ar.edu.agricultores

import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestSojaTransgenica {
	
	Parcela parcela50
	Parcela parcela200
	
	@Before
	def void init() {
		parcela50 = new Parcela(50, new SojaTransgenica(true))	
		parcela200 = new Parcela(200, new SojaTransgenica(false))
	}
	
	// PUNTO 1
	
	@Test
	def testCostoSojaTransgenica() {
		Assert.assertEquals(500, parcela50.costoTotal, 0.1)
		Assert.assertEquals(2000, parcela200.costoTotal, 0.1)
	}	
	
	// PUNTO 2
	
	@Test
	def testVentaSojaParcelaChica() {
		Assert.assertEquals(2500,parcela50.precioVenta, 0.1)
	}		

	@Test
	def testVentaSojaParcelaGrande() {
		Assert.assertEquals(20000, parcela200.precioVenta, 0.1)
	}	
	
}