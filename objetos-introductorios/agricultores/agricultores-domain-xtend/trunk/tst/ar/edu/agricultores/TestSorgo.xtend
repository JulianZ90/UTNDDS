package ar.edu.agricultores

import org.junit.Before
import org.junit.Test
import org.junit.Assert

class TestSorgo {
	
	Parcela parcela200
	Parcela parcela40
	
	@Before
	def void init() {
		parcela200 = new Parcela(200, new Sorgo)
		parcela40 = new Parcela(40, new Sorgo)	
	}
	
	// PUNTO 1
	
	@Test
	def testCostoSorgoParcela40() {
		Assert::assertEquals(parcela40.costoTotal, 120, 0.1)
	}

	@Test
	def testCostoSorgoParcela200() {
		Assert::assertEquals(parcela200.costoTotal, 400, 0.1)
	}
	
	// PUNTO 2
	
	@Test
	def testVentaSojaParcelaChica() {
		Assert::assertEquals(parcela40.precioVenta, 20, 0.1)
	}		

	@Test
	def testVentaSojaParcelaGrande() {
		Assert::assertEquals(parcela200.precioVenta, 20, 0.1)
	}
			
}