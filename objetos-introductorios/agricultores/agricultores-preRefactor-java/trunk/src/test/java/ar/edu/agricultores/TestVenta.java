package ar.edu.agricultores;

import java.util.Date;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class TestVenta {

	Parcela parcela50;
	Venta ventaNacional;
	Venta ventaExportacion;
	
	@Before
	public void init() {
		parcela50 = new Parcela(50, new Sorgo());	
		
		ventaNacional = new Venta();
		ventaNacional.cantidadKilos = 12;
		ventaNacional.tipoComprador = "N";
		ventaNacional.fechaVenta = new Date();
		ventaNacional.parcela = parcela50;

		ventaExportacion = new Venta();
		ventaExportacion.cantidadKilos = 11;
		ventaExportacion.tipoComprador = "E";
		ventaExportacion.fechaVenta = new Date();
		ventaExportacion.parcela = parcela50; 
	}

	// PUNTO 3
	
	@Test
	public void testVentaCompradorNacionalMenos500Kilos() {
		Assert.assertEquals(240, ventaNacional.precio(), 0.1);
	}
		
	@Test
	public void testVentaCompradorNacionalMas500Kilos() {
		ventaNacional.cantidadKilos = 600;
		Assert.assertEquals(13200, ventaNacional.precio(), 0.1);
	}

	@Test
	public void testVentaCompradorExtranjero() {
		Assert.assertEquals(308, ventaExportacion.precio(), 0.1);
	}

}
