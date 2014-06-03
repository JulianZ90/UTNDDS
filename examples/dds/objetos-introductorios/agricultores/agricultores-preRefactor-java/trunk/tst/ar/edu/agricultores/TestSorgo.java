package ar.edu.agricultores;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class TestSorgo {

	Parcela parcela200;
	Parcela parcela40;
	
	@Before
	public void init() {
		parcela200 = new Parcela(200, new Sorgo());
		parcela40 = new Parcela(40, new Sorgo());
	}
	
	// PUNTO 1
	
	@Test
	public void testCostoSorgoParcela40() {
		Assert.assertEquals(120, parcela40.getCostoTotal(), 0.1);
	}

	@Test
	public void testCostoSorgoParcela200() {
		Assert.assertEquals(400, parcela200.getCostoTotal(), 0.1);
	}
	
	// PUNTO 2
	
	@Test
	public void testVentaSorgoParcelaChica() {
		Assert.assertEquals(20, parcela40.precioVenta(), 0.1);
	}		

	@Test
	public void testVentaSorgoParcelaGrande() {
		Assert.assertEquals(20, parcela200.precioVenta(), 0.1);
	}

}
