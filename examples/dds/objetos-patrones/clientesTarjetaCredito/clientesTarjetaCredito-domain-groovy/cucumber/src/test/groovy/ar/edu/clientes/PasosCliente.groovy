package ar.edu.clientes

import org.junit.Assert;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import cucumber.api.java.es.Cuando;
import cucumber.api.java.es.Dado;
import cucumber.api.java.es.Entonces;

class PasosCliente {

	def unCliente
	def expectedException
	
	@Given("^un cliente con un saldo de (\\d+)")
	def clienteConSaldoDe(int monto) {
		unCliente = new Cliente(saldo: monto)
	}

	@And("^safe shop con monto maximo de (\\d+)")
	def safeShopConMontoMaximoDe(int monto) {
		def clienteTemp = unCliente
		unCliente = new SafeShopDecorator(cliente: clienteTemp, montoMaximoSafeShop: monto)
	}
	
	@When("^compra algo de (\\d+)")
	def clienteCompraAlgoDePrecio (int precio){
		try {
			unCliente.comprar(precio)
		} catch (Exception e) {
			expectedException = e
		}
	}

	@When("^compra los siguientes items:")
	def clienteCompraItems(List<ItemDeCompra> items) {
		items.each{ unCliente.comprar(it.precio) }
	}
	
	@Then("^le queda (\\d+) de saldo")
	def leQueda(int expected){
		Assert.assertEquals(expected, unCliente.saldo)
		//puedo hacer el getSaldo de Cliente porque groovy me regala los accessors.
	}

	@Then("^el usuario recibe un error")
	def usuarioRecibeError(){
		assert expectedException in Exception
	}

}

class ItemDeCompra {
	def int precio
	def nombre
}
