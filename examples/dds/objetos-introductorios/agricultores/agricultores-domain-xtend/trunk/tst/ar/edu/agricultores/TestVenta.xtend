package ar.edu.agricultores

import org.junit.Before
import ar.edu.agricultores.venta.Venta
import ar.edu.agricultores.venta.CompradorNacional
import ar.edu.agricultores.Parcela
import java.util.Date
import org.junit.Test
import org.junit.Assert
import ar.edu.agricultores.venta.CompradorExtranjero

class TestVenta {
	
	Parcela parcela50
	Venta ventaNacional
	Venta ventaExportacion
	
	@Before
	def void init() {
		parcela50 = new Parcela(50, new Sorgo)	
		
		ventaNacional = new Venta
		ventaNacional.cantidadKilos = 12
		ventaNacional.comprador = new CompradorNacional
		ventaNacional.fechaVenta = new Date
		ventaNacional.parcela = parcela50 

		ventaExportacion = new Venta
		ventaExportacion.cantidadKilos = 11
		ventaExportacion.comprador = new CompradorExtranjero
		ventaExportacion.fechaVenta = new Date
		ventaExportacion.parcela = parcela50 
	}

	// PUNTO 3
	
	@Test
	def testVentaCompradorNacionalMenos500Kilos() {
		Assert::assertEquals(ventaNacional.montoTotal, 240, 0.1)
	}
		
	@Test
	def testVentaCompradorNacionalMas500Kilos() {
		ventaNacional.cantidadKilos = 600
		Assert::assertEquals(ventaNacional.montoTotal, 13200, 0.1)
	}

	@Test
	def testVentaCompradorExtranjero() {
		Assert::assertEquals(ventaExportacion.montoTotal, 308, 0.1)
	}
		
}