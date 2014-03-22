package ar.edu.agricultores

import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestTrigo {

	Parcela parcela200
	Parcela parcela50
	
	@Before
	def void init() {
		val Trigo cultivoTrigo = new Trigo
		cultivoTrigo.agregarConservante(new Conservante(2, "Glifosato"))
		cultivoTrigo.agregarConservante(new Conservante(5, "Sulfatadina M-150"))
		parcela50 = new Parcela(50, cultivoTrigo)
		parcela200 = new Parcela(200, new Trigo)
	}

	// PUNTO 1
	
	@Test
	def testCostoBaseParcela200Hectareas() {
		Assert.assertEquals(500, parcela200.costoTotal, 0.1)
	}

	@Test
	def testCostoBaseParcela50Hectareas() {
		Assert.assertEquals(250, parcela50.costoTotal, 0.1)
	}

	// PUNTO 2

	@Test
	def testVentaSojaParcelaChica() {
		Assert.assertEquals(13, parcela50.precioVenta, 0.1)
	}		

	@Test
	def testVentaSojaParcelaGrande() {
		Assert.assertEquals(20, parcela200.precioVenta, 0.1)
	}

}