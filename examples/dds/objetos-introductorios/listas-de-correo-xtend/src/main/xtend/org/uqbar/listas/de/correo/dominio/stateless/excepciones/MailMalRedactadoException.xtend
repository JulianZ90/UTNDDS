package org.uqbar.listas.de.correo.dominio.stateless.excepciones

import org.uqbar.listas.de.correo.dominio.Mail

class MailMalRedactadoException extends RuntimeException{

	@Property	
	Mail mail
	
	new(Mail mail, String mensaje, Throwable cause) {
		super(mensaje, cause)
		this.mail = mail
	}
	
}