package ar.edu.agricultores

import org.junit.Before
import org.junit.Test
import org.junit.Assert

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
		Assert::assertEquals(parcela50.costoTotal, 500, 0.1)
		Assert::assertEquals(parcela200.costoTotal, 2000, 0.1)
	}	
	
	// PUNTO 2
	
	@Test
	def testVentaSojaParcelaChica() {
		Assert::assertEquals(parcela50.precioVenta, 2500, 0.1)
	}		

	@Test
	def testVentaSojaParcelaGrande() {
		Assert::assertEquals(parcela200.precioVenta, 20000, 0.1)
	}	
}