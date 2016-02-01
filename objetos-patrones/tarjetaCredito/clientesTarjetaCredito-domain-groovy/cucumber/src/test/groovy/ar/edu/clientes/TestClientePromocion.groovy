package ar.edu.clientes;

import static org.junit.Assert.*

import org.junit.Before
import org.junit.Test

import ar.edu.clientes.exception.BusinessException

class TestClientePromocion {
	def jose
	def joseConPromocion
	
	@Before
	void init() {
		jose = new Cliente(saldo: 150)
		joseConPromocion = new PromocionDecorator(cliente: jose)		
	}
	
	@Test
	void comprarPromocion() {
		assertEquals(0, joseConPromocion.puntos)
		joseConPromocion.comprar(52)
		assertEquals(15, joseConPromocion.puntos)
		assertEquals(98, joseConPromocion.saldo)
		
	}
	
	
	
}
