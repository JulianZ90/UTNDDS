package ar.edu.pila

import static org.junit.Assert.fail

import org.junit.Assert
import org.junit.Before
import org.junit.Test

class PilaTest {

	def pila
	def pilaVacia
	
	@Before
	public void init() {
		pila = new Pila()
		pila.poner(10)
		pila.poner(49)
		pila.sacar()
		pilaVacia = new Pila()
	}
	
	@Test
	public void testPilaVacia() {
		println(pilaVacia.tope())
		Assert.assertNull(pilaVacia.tope())
	}
	
	@Test
	public void testPilaApiladaYDesapilada() {
		Assert.assertEquals(10, pila.tope())
	}

}
