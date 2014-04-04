package ar.org.uqbar.disenio.listas;

import static org.junit.Assert.*;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

class ListaAbiertaTest {
	
	def lista
	def miembro
	
	@Before
	void setUp() {
		lista = new ListaCorreoBuilder().abierta().restringida().build();
		miembro = new Miembro(mailDefault:"lgassman@gmail.com")
	}
	
	@Test
	void suscribir() throws Exception {
		lista.suscribir(miembro);
		Assert.assertTrue(lista.miembros.contains(miembro))
	}

}
