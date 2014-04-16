package org.uqbar.listas.de.correo.dominio

import org.junit.Test
import org.uqbar.listas.de.correo.dominio.factory.ListaDeCorreoFactory

import static junit.framework.Assert.*

class ListaDeCorreoTest {
	@Test
	def testSuscribirUnUsuarioAUnaListaAbiertaLoAdmite() {
		var lista = crearListaAbierta()
		var suscripto = this.crearUsuario
		
		lista.suscribir(suscripto)
		
		assertTrue("Es una lista abierta si lo suscribimos deberia estar",lista.estaSuscripto(suscripto))
	}
	
	@Test
	def testSuscribirUnUsuarioAUnaCerradaLoDejaComoPendiente() {
		var lista = crearListaCerrada()
		var suscripto = this.crearUsuario
		
		lista.suscribir(suscripto)
		
		assertTrue("Lo suscribimos pero no lo aprobamos deberia estar pendiente", lista.tipoDeSuscripcion.estaPendiente(suscripto))
	}
	
	
	@Test
	def testSuscribirUnUsuarioYaSuscriptoEnUnaListaCerradaNoLoDejaComoPendiente() {
		var lista = this.crearListaCerrada
		var suscripto = this.crearUsuario
		lista.suscribir(suscripto)
		lista.tipoDeSuscripcion.aprobar(suscripto)
		
		lista.suscribir(suscripto)
		
		assertFalse( "Ya está suscripto, no deberia estar pendiente", lista.tipoDeSuscripcion.estaPendiente(suscripto))
	}
	
	
	@Test
	def testSuscribirUnUsuarioYaSuscriptoEnUnaListaAbiertaLoTieneUnaVez() {
		fail("not implemented")
	}
	
	@Test
	def testAprobarUnaSuscripcionPendienteEnUnaListaCerradaLoPasaASuscriptos() {
		fail("not implemented")
	}
	
	@Test
	def testNoSePuedeAprobarUnaSuscripcionDeUnUsuarioQueNoEstaPendiente() {
		fail("not implemented")
	}


	def ListaDeCorreo crearListaAbierta(){
		ListaDeCorreoFactory.crearListaAbierta
	}
	def ListaDeCorreo crearListaCerrada(){
		ListaDeCorreoFactory.crearListaCerrada
	}
	
	def Usuario crearUsuario(){
		new Usuario("nnn@nn.com")
	}
	

}