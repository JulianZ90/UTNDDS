package org.uqbar.listas.de.correo.adapter.envioDeMails

import enviadorDeMails.distribuidor.DistribuidorDeMailsSuperPerfomanteYSeguro
import java.util.Date
import org.uqbar.listas.de.correo.dominio.Cartero
import org.uqbar.listas.de.correo.dominio.Mail
import org.uqbar.listas.de.correo.dominio.Usuario

class CarteroDistribuidor implements Cartero {
	
	override enviarMail(Mail mail, Usuario destinatario) {
		var distribuidorSeguro = new DistribuidorDeMailsSuperPerfomanteYSeguro
		
		distribuidorSeguro.dispararMensajeALasDirecciones(
			new UsuarioEnviador(mail.remitente),
			new UsuarioReceptor(destinatario, mail.remitente),
			new Date(),
			mail.getTitulo,
			mail.getTexto,
			false,
			false);
	}
	
}