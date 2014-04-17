package org.uqbar.listas.de.correo.dominio

import static junit.framework.Assert.*
import org.junit.Test
import org.uqbar.listas.de.correo.dominio.factory.ListaDeCorreoFactory

class EnviarMailALaLista {
	
	@Test
	def testEnviarMailAUnaListaLibreDeUnNoInscriptoLlegaALosInscriptos(){
		var inscripto = this.crearUsuario
		var mailEnviado = this.crearMail
		var lista = this.crearListaLibre 
		lista.suscribir(inscripto)
		
		lista.enviarMail(mailEnviado)
		
		assertTrue(inscripto.recibioMail(mailEnviado))
	}
	
	@Test
	def testEnviarMailAUnaListaRestringidaDeUnNoInscriptoNoLlega(){
		var inscripto = this.crearUsuario
		var mailEnviado = this.crearMail
		var lista = this.crearListaRestringida 
		lista.suscribir(inscripto)
		
		lista.enviarMail(mailEnviado)
		
		assertFalse(inscripto.recibioMail(mailEnviado))
	}
	
	@Test
	def testEnviarMailAUnaListaRestringidaDeUnInscriptoLlega(){
		var inscripto = this.crearUsuario
		var mailEnviado = this.crearMail
		var lista = this.crearListaRestringida 
		lista.suscribir(inscripto)
		lista.suscribir(mailEnviado.remitente)
		
		lista.enviarMail(mailEnviado)
		
		assertTrue(inscripto.recibioMail(mailEnviado))
	}
	
	def crearListaRestringida() {
		ListaDeCorreoFactory.crearListaAbiertaRestringida
	}
	
	def crearListaLibre() {
		ListaDeCorreoFactory.crearListaAbiertaLibre
	}
	
	def crearMail() {
		new Mail(this.crearUsuario, "Prueba", "Contenido de un mail")
	}
	
	def crearUsuario() {
		new Usuario("a@a.com")
	}
	
}