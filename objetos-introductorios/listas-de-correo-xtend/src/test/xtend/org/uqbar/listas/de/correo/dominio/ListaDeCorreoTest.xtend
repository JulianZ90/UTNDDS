package org.uqbar.listas.de.correo.dominio

import org.junit.Test

import static junit.framework.Assert.*
import org.uqbar.listas.de.correo.dominio.stateless.tipoSuscripcion.SuscripcionAbiertaStateLess
import org.uqbar.listas.de.correo.dominio.stateless.tipoSuscripcion.SuscripcionCerradaStateLess

class ListaDeCorreoTest {
	@Test
	def testSuscribirUnUsuarioAUnaListaAbiertaLoAdmite() {
		var lista = crearListaAbierta()
		var suscripto = new Usuario
		
		lista.suscribir(suscripto)
		
		assertTrue("Es una lista abierta si lo suscribimos deberia estar",lista.estaSuscripto(suscripto))
	}
	
	@Test
	def testSuscribirUnUsuarioAUnaCerradaLoDejaComoPendiente() {
		var lista = crearListaCerrada()
		var suscripto = new Usuario
		
		lista.suscribir(suscripto)
		
		assertTrue("Lo suscribimos pero no lo aprobamos deberia estar pendiente",lista.estaPendiente(suscripto))
	}
	
	
	@Test
	def testSuscribirUnUsuarioYaSuscriptoEnUnaListaCerradaNoLoDejaComoPendiente() {
		var lista = this.crearListaCerrada
		var suscripto = new Usuario
		lista.suscribir(suscripto)
		lista.aprobar(suscripto)
		
		lista.suscribir(suscripto)
		
		assertFalse( "Ya está suscripto, no deberia estar pendiente", lista.estaPendiente(suscripto))
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
		new ListaDeCorreo(new SuscripcionAbiertaStateLess)
	}
	def ListaDeCorreo crearListaCerrada(){
		new ListaDeCorreo(new SuscripcionCerradaStateLess)
	}
	

}