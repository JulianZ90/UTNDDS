package ar.edu.design.examples.clientesTarjetaCredito.feature;

import ar.edu.design.examples.clientesTarjetaCredito.domain.ClientePosta;
import junit.framework.Assert;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class ClienteDefSteps {

	
	private ClientePosta cliente;

	@Given("^a client with an initial amount of (\\d+)$")
	public void tengoUnClienteConMontoInicial(int monto) {
		cliente = new ClientePosta(monto);
	}
	
	@When("^I ask him to pay an expiration of (\\d+)$")
	public void clientePagaVenciniento(int monto) {
		cliente.pagarVencimiento(monto);
	}
	
	@Then("^the client must not be... eh... moroso$")
	public void elClienteNoDebeSerMoroso() {
		Assert.assertFalse("El cliente es moroso", cliente.esMoroso());
	}
}
