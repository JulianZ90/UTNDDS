package ar.edu.vehiculos;

import org.junit.Before;
import org.junit.Test;


public class TestVehiculo {

	Vehiculo boeing;
	Vehiculo fitito;
	Vehiculo fierrito;
	
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
		fitito.chocar(fierrito);
	}
	
	@Test(expected=Exception.class)
	public void testChocarBoeingConFitito() {
		boeing.chocar(fitito);
	}
}
