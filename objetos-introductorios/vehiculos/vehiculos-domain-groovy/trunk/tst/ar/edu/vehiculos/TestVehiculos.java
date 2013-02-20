package ar.edu.vehiculos;

import org.junit.Before;
import org.junit.Test;

/**
 * Clase test java que accede a clases groovy
 * 
 * @author Dodain
 *
 */
public class TestVehiculos {

	Avion boeing;
	Auto fitito;
	Auto fierrito;

	@Before
	public void setUp() throws Exception {
		boeing = new Avion();
		fitito = new Auto();
		fierrito = new Auto();
	}

	@Test
	public void testAvanzarFitito() {
		fitito.avanzar();
	}

	@Test
	public void testChocarFititoConFierrito() {
		fitito.chocarCon(fierrito);
	}

	@Test(expected = Exception.class)
	public void testChocarBoeingConFitito() {
		boeing.chocarCon(fitito);
	}

}
