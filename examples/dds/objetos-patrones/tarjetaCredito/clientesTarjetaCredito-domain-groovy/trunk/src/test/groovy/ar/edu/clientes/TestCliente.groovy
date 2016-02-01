package ar.edu.clientes;

import static org.junit.Assert.*

import org.junit.Before
import org.junit.Test

import ar.edu.clientes.exception.BusinessException

class TestCliente {
	def jose
	def joseConSafeShop
	
	@Before
	void init() {
		jose = new Cliente(saldo: 40)
		joseConSafeShop = new SafeShopDecorator(cliente: jose, montoMaximoSafeShop: 20)		
	}
	
	@Test
	void comprarClienteComun() {
		jose.comprar(25)
		assertEquals(15, jose.saldo)
	}
	
	@Test(expected=BusinessException)
	void compraCanceladaClienteSafeShop() {
		joseConSafeShop.comprar(25)
	}
	
	@Test
	void comprarOkClienteSafeShop() {
		joseConSafeShop.comprar(15)
	}
	
}
