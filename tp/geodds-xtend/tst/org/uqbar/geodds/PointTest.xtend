package org.uqbar.geodds

import org.junit.Assert
import org.junit.Before
import org.junit.Test

class PointTest {
	
	Point bombonera
	Point comisaria24
	Point obelisco
	
	@Before
	def void init() {
		bombonera = new Point(-34.63565, -58.36465)
		comisaria24 = new Point(-34.6342281,-58.3603267)
		obelisco = new Point(-34.603739,-58.38157)
	}
	
	@Test
	def void bomboneraYLa24QuedanACasi4Cuadras() {
		Assert.assertEquals("La 24 está a más de 4 cuadras de la Bombonera", 0.4, bombonera.distance(comisaria24), 0.5)
	}
	
	@Test
	def void bomboneraAlObeliscoSon39Cuadras() {
		// en realidad son 45 teniendo en cuenta restricciones de calles
		Assert.assertEquals("Hay que caminar más de 39 cuadras para llegar al obelisco", 3.9, bombonera.distance(obelisco), 0.5)
	}
	
}