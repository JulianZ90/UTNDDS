package ar.edu.design.examples.clientesTarjetaCredito.feature;

import junit.framework.Assert;
import cucumber.api.java.es.Cuando;
import cucumber.api.java.es.Dado;
import cucumber.api.java.es.Entonces;
import ar.edu.design.examples.clientesTarjetaCredito.domain.Cliente;
import ar.edu.design.examples.clientesTarjetaCredito.domain.ClientePosta;

public class ClienteDefinicionDePasos {

	Cliente cliente;
	Cliente gastatutti;
	Cliente promosao;
	Cliente mixto;

	@Dado("^un cliente con deuda inicial de (\\d+)$")
	public void tengoUnClienteConMontoInicial(int monto) {
		cliente = new ClientePosta(monto);
	}
	
//	@Dado("^un cliente con un valor inicial de (\\d+)$")
	
	@Cuando("^el cliente paga un vencimiento de (\\d+)$")
	public void clientePagaVenciniento(int monto) {
		cliente.pagarVencimiento(monto);
	}
	
	@Entonces("^el cliente no debe ser moroso$")
	public void elClienteNoDebeSerMoroso() {
		Assert.assertFalse("El cliente es moroso", cliente.esMoroso());
	}
}
