package org.uqbar.listas.de.correo.dominio.stateless.excepciones

import org.uqbar.listas.de.correo.dominio.ListaDeCorreo
import org.uqbar.listas.de.correo.dominio.Mail

/**
 * Significa que no se puede enviar el mail porque el remitente del mail
 * no esta autorizado a mandar mails al destinatario
 * @author gi
 *
 */
class EnvioNoPermitidoException extends RuntimeException{
	@Property
	Mail mail
	
	@Property
	ListaDeCorreo destinatario
	
	new(Mail mailNoEnviado, ListaDeCorreo destino){
		super("El remitente no está suscripto en la lista destino");
		this.mail = mailNoEnviado;
		this.destinatario = destino;
	}
	
}