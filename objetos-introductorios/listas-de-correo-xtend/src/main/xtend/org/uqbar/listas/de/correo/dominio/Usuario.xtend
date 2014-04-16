package org.uqbar.listas.de.correo.dominio

import java.util.Collection
import java.util.ArrayList

/**
 * Un usuario es un suscriptor a una lista
 */
class Usuario {
	@Property
	String emailParaLaLista
	
	Collection<String> mailsDelUsuario
	
	Collection<Mail> recibidos
	
	new(String mail){
		mailsDelUsuario = new ArrayList
		mailsDelUsuario.add(mail)
		recibidos = new ArrayList
		emailParaLaLista = mail
	}
	
	def recibirMail(Mail mail){
		recibidos.add(mail)
	}

	def esSuDireccion(String direccionDeMail) {
		mailsDelUsuario.contains(direccionDeMail)
	}

	def recibioMail(Mail mail) {
		recibidos.contains(mail)
	}
	
}