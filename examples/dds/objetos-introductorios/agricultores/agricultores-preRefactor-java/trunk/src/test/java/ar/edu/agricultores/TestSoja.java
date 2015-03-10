package ar.edu.agricultores;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class TestSoja {

	Parcela parcela50;
	Parcela parcela300;
	Parcela parcela2000;
	
	@Before
	public void init() {
		parcela50 = new Parcela(50, new Soja());
		parcela300 = new Parcela(300, new Soja());
		parcela2000 = new Parcela(2000, new Soja());
	}
	
	// PUNTO 1
	
	@Test
	public void testCostoSoja() {
		Assert.assertEquals(500, parcela50.getCostoTotal(), 0.1);
		Assert.assertEquals(3000, parcela300.getCostoTotal(), 0.1);
	}		

	// PUNTO 2
	
	@Test
	public void testVentaSojaParcelaChica() {
		Assert.assertEquals(30000, parcela300.precioVenta(), 0.1);
	}		

	@Test
	public void testVentaSojaParcelaGrande() {
		Assert.assertEquals(180000, parcela2000.precioVenta(), 0.1);
	}		

}
