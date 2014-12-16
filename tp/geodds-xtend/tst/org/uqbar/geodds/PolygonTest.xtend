package org.uqbar.geodds

import org.junit.Assert
import org.junit.Before
import org.junit.Test

class PolygonTest {
	
	Point bombonera
	Point obelisco
	Point aristobuloDelValle700
	Polygon laBoca
	
	@Before
	def void init() {
		bombonera = new Point(-34.63565, -58.36465)
		obelisco = new Point(-34.603739,-58.38157)
		laBoca = new Polygon(#[new Point(-34.634291, -58.366412), new Point(-34.639199, -58.363601), new Point(-34.635068, -58.355576), new Point(-34.631466, -58.359395)])
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
	
}