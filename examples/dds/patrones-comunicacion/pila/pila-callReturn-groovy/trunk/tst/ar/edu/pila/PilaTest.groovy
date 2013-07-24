package ar.edu.pila

import static org.junit.Assert.fail

import org.junit.Assert;
import org.junit.Before
import org.junit.Test

class PilaTest {

	def pila
	def pilaVacia
	
	@Before
	public void init() {
		pila = Pila.empty.poner(10).poner(49).sacar()
		pilaVacia = Pila.empty
	}
	
	@Test
	public void testPilaVacia() {
		Assert.assertNull(pilaVacia.tope())
	}
	
	@Test
	public void testPilaApiladaYDesapilada() {
		Assert.assertEquals(10, pila.tope())
	}

}
