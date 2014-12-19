package org.uqbar.geodds

import org.junit.Assert
import org.junit.Before
import org.junit.Test

class PolygonTest {
	
	Point bombonera
	Point obelisco
	Point aristobuloDelValle700
	Polygon laBoca
	Polygon laBocaSinLaBombonera
	
	@Before
	def void init() {
		// Gracias a http://www.mapcoordinates.net/es
		bombonera = new Point(-34.63565, -58.36465)
		obelisco = new Point(-34.603739,-58.38157)
		laBoca = new Polygon(#[new Point(-34.634291, -58.366412), new Point(-34.639199, -58.363601), new Point(-34.635068, -58.355576), new Point(-34.631466, -58.359395)])
		laBocaSinLaBombonera = new Polygon(#[new Point(-34.63398475, -58.36969614), new Point(-34.63917526, -58.368752), new Point(-34.63804538, -58.36132765), new Point(-34.63387882, -58.36179972), new Point(-34.6369508, -58.36373091), new Point(-34.63737451, -58.36613417)])
		aristobuloDelValle700 = new Point(-34.634520, -58.364181)
	}
	
	@Test
	def void aristobuloDelValleAl700EstaEnLaBoca() {
		Assert.assertTrue(laBoca.isInside(aristobuloDelValle700))
	}
	
	@Test
	def void laBomboneraEstaEnLaBoca() {
		Assert.assertTrue(laBoca.isInside(bombonera))
	}

	@Test
	def void elObeliscoNoEstaEnLaBoca() {
		Assert.assertTrue(laBoca.isInside(bombonera))
	}

	@Test
	def void laBomboneraNoEstaEnUnPoligonoIrregular() {
		Assert.assertFalse(laBocaSinLaBombonera.isInside(bombonera))
	}

	@Test
	def void elObeliscoNoEstaEnLaBocaComoPoligonoIrregular() {
		Assert.assertFalse(laBocaSinLaBombonera.isInside(obelisco))
	}

	@Test
	def void alCostadoDeLaBomboneraNoFiguraEnLaBocaComoPoligonoIrregular() {
		Assert.assertFalse(laBocaSinLaBombonera.isInside(new Point(-34.63790415, -58.37016821)))
	}

	@Test
	def void unPuntoDelPoligonoFiguraEnLaBocaComoPoligonoIrregular() {
		Assert.assertFalse(laBocaSinLaBombonera.isInside(new Point(-34.63725093, -58.36571574)))
	}
	
}