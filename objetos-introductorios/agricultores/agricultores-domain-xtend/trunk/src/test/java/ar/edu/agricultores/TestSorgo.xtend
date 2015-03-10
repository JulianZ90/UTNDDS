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
		Assert::assertEquals(120, parcela40.costoTotal, 0.1)
	}

	@Test
	def testCostoSorgoParcela200() {
		Assert::assertEquals(400, parcela200.costoTotal, 0.1)
	}
	
	// PUNTO 2
	
	@Test
	def testVentaSorgoParcelaChica() {
		Assert.assertEquals(20, parcela40.precioVenta, 0.1)
	}		

	@Test
	def testVentaSorgoParcelaGrande() {
		Assert.assertEquals(20, parcela200.precioVenta, 0.1)
	}
			
}