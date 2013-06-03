package ar.edu.seleccionPersonal

import org.junit.Assert
import org.junit.Before
import org.junit.Test


class TestPostulante {

	Postulante lopez
	
	@Before
	def void init() {
		lopez = new PersonalPlanta(fechaIngreso: new Date(108, 1, 10))
	}
	
	@Test
	def void testAntiguedad() {
		Assert.assertEquals(6, lopez.getAntiguedad(new Date(113, 4, 2)))
	}
	
}
