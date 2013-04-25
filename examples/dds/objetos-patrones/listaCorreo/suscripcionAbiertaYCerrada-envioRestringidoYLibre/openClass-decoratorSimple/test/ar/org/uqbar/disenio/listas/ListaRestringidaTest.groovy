package ar.org.uqbar.disenio.listas;

import static org.junit.Assert.*;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

class ListaRestringidaTest {
	
	def lista;
	def emailSenderMock;
	
	@Before
	void setUp() {
		emailSenderMock = new EmailSenderMock();
		EmailSenderProvider.emailSender = emailSenderMock;
		lista = new ListaCorreoBuilder().abierta().restringida().build();
		lista.agregarMiembro(new Miembro(mailDefault:"lgassman@gmail.com"));
		lista.agregarMiembro(new Miembro(mailDefault:"npasserini@gmail.com"));
		lista.agregarMiembro(new Miembro(mailDefault:"tesonep@gmail.com"));
	}
	
	@Test(expected=RuntimeException.class) 
	void enviarExterno() throws Exception {
		def post = new Post(from:"fulano@gmail.com", subject:"hola", content:"yeah")
		lista.enviar(post);
	}

	@Test 
	void enviarInterno() throws Exception {
		def post = new Post(from:"lgassman@gmail.com", subject:"hola", content:"yeah")
		lista.enviar(post);
		emailSenderMock.assertPostEnviado("Se esperaba que le llegue a todos los miembros menos a lgassman@gmail.com", 2, post);
	}


}
