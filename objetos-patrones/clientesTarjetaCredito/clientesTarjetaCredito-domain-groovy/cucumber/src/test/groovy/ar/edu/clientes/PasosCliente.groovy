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

	def unCliente;
	
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
		unCliente.comprar(precio)
	}

	@Then("^le queda (\\d+) de saldo")
	def leQueda(int expected){
		Assert.assertEquals(expected, unCliente.getSaldo())
		//puedo hacer el getSaldo de Cliente porque groovy me regala los accessors.
	}
	
}
