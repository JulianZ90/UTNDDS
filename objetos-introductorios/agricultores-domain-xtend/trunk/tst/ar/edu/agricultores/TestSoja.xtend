package ar.edu.agricultores

import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestSoja {
	
	Parcela parcela50
	Parcela parcela300
	Parcela parcela2000
	
	@Before
	def void init() {
		parcela50 = new Parcela(50, new Soja)	
		parcela300 = new Parcela(300, new Soja)
		parcela2000 = new Parcela(2000, new Soja)
	}
	
	// PUNTO 1
	
	@Test
	def testCostoSoja() {
		Assert::assertEquals(parcela50.costoTotal, 500, 0.1)
		Assert::assertEquals(parcela300.costoTotal, 3000, 0.1)
	}		

	// PUNTO 2
	
	@Test
	def testVentaSojaParcelaChica() {
		Assert::assertEquals(parcela300.precioVenta, 30000, 0.1)
	}		

	@Test
	def testVentaSojaParcelaGrande() {
		Assert::assertEquals(parcela2000.precioVenta, 180000, 0.1)
	}		
		
}