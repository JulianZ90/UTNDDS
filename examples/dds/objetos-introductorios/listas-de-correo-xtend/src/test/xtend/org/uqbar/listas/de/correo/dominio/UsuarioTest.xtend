package org.uqbar.listas.de.correo.dominio

import org.junit.Assert
import org.junit.Test

class UsuarioTest {
	
	
	@Test
	def testCrearUnUsuarioConMailLoTieneComoSusMails(){
		var direccionDeMail = "aaa@a.com"
		var usuario = new Usuario(direccionDeMail)
		
		Assert.assertTrue(usuario.esSuDireccion(direccionDeMail))
	}
	
	@Test
	def testRecibirUnMailLoDejaEnSusRecibidos(){
		var usuario = new Usuario("a@a.com")
		var mail = crearMail()
		
		usuario.recibirMail(mail)
		
		Assert.assertTrue(usuario.recibioMail(mail))
	}
	
	def crearMail() {
		new Mail(new Usuario(""), "", "")
	}
	
}