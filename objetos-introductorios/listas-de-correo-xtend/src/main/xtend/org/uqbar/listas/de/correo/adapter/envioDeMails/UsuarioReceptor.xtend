package org.uqbar.listas.de.correo.adapter.envioDeMails

import enviadorDeMails.EnviadorDeMails
import enviadorDeMails.RecibidorDeMails
import java.util.Date
import org.uqbar.listas.de.correo.dominio.Usuario

class UsuarioReceptor implements RecibidorDeMails {
	Usuario receptor
	Usuario remitente
	
	new(org.uqbar.listas.de.correo.dominio.Usuario usuario, org.uqbar.listas.de.correo.dominio.Usuario remitente) {
		this.receptor = usuario
		this.remitente = remitente
	}
	
	
	
	override recibirMail(EnviadorDeMails emisor, String subject, String body, boolean estaFirmado, Date fechaDeEnvio) {
		var mailARecibir = new org.uqbar.listas.de.correo.dominio.Mail(remitente, subject, body) 
		receptor.recibirMail(mailARecibir)
	}
	
}