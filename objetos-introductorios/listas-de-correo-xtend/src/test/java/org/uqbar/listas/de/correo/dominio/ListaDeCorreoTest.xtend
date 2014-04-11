package org.uqbar.listas.de.correo.dominio

import org.junit.Test
import static junit.framework.Assert.*
import org.uqbar.listas.de.correo.dominio.tipoSuscripcion.SuscripcionAbierta

class ListaDeCorreoTest {
	@Test
	def testSuscribirUnUsuarioAUnaListaAbiertaLoAdmite() {
		var lista = new ListaDeCorreo(new SuscripcionAbierta)
		var suscripto = new Usuario
		
		lista.suscribir(suscripto)
		
		assertTrue(lista.estaSuscripto(suscripto))
	}




}