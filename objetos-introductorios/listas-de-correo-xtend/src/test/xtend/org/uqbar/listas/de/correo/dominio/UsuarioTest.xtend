package org.uqbar.listas.de.correo.dominio

import org.junit.Test
import org.junit.Assert

class UsuarioTest {
	@Test
	def testCrearUnUsuarioConMailLoTieneComoSusMails(){
		var direccionDeMail = "aaa@a.com"
		var usuario = new Usuario(direccionDeMail)
		
		Assert.assertTrue(usuario.esSuDireccion(direccionDeMail))
	}
	
}