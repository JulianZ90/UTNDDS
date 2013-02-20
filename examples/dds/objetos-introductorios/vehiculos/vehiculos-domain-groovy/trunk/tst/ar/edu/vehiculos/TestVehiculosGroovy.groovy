package ar.edu.vehiculos

import org.junit.Before
import org.junit.Test

/**
 * 
 * Test groovy
 * 
 * @author Dodain
 *
 */
class TestVehiculosGroovy {

	/** las variables se pueden definir con tipos */
	Avion boeing
	/** o trabajar con tipos dinámicos */
	def fitito
	def fierrito

	@Before
	public void setUp() throws Exception {
		boeing = new Avion()
		fitito = new Auto()
		fierrito = new Auto()
	}

	@Test
	public void testAvanzarFitito() {
		fitito.avanzar()
	}

	@Test
	public void testChocarFititoConFierrito() {
		fitito.chocarCon(fierrito)
	}

	@Test(expected = Exception.class)
	public void testChocarBoeingConFitito() {
		boeing.chocarCon(fitito)
	}

}
