package org.uqbar.listas.de.correo.dominio

import org.junit.Test
import org.uqbar.listas.de.correo.dominio.stateless.tipoEnvio.TipoDeEnvioLibre
import org.uqbar.listas.de.correo.dominio.stateless.tipoSuscripcion.SuscripcionAbiertaStateLess
import junit.framework.Assert
import org.uqbar.listas.de.correo.dominio.stateless.tipoEnvio.TipoDeEnvioRestringido

class EnviarMailALaLista {
	@Test
	def testEnviarMailAUnaListaLibreDeUnNoInscriptoLlegaALosInscriptos(){
		var inscripto = this.crearUsuario
		var mailEnviado = this.crearMail
		var lista = this.crearListaLibre 
		lista.suscribir(inscripto)
		
		lista.enviarMail(mailEnviado)
		
		Assert.assertTrue(inscripto.recibioMail(mailEnviado))
	}
	
	@Test
	def testEnviarMailAUnaListaRestringidaDeUnNoInscriptoNoLlega(){
		var inscripto = this.crearUsuario
		var mailEnviado = this.crearMail
		var lista = this.crearListaRestringida 
		lista.suscribir(inscripto)
		
		lista.enviarMail(mailEnviado)
		
		Assert.assertFalse(inscripto.recibioMail(mailEnviado))
	}
	
	@Test
	def testEnviarMailAUnaListaRestringidaDeUnInscriptoLlega(){
		var inscripto = this.crearUsuario
		var mailEnviado = this.crearMail
		var lista = this.crearListaRestringida 
		lista.suscribir(inscripto)
		lista.suscribir(mailEnviado.remitente)
		
		lista.enviarMail(mailEnviado)
		
		Assert.assertTrue(inscripto.recibioMail(mailEnviado))
	}
	
	def crearListaRestringida() {
		new ListaDeCorreo(new SuscripcionAbiertaStateLess, new TipoDeEnvioRestringido)
	}
	
	def crearListaLibre() {
		new ListaDeCorreo(new SuscripcionAbiertaStateLess, new TipoDeEnvioLibre)
	}
	
	def crearMail() {
		new Mail(this.crearUsuario, "Prueba", "Contenido de un mail")
	}
	
	def crearUsuario() {
		new Usuario("a@a.com")
	}
	
}