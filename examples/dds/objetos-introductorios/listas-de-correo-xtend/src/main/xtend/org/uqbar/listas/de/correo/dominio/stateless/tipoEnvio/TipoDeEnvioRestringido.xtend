package org.uqbar.listas.de.correo.dominio.stateless.tipoEnvio

import org.uqbar.listas.de.correo.dominio.ListaDeCorreo
import org.uqbar.listas.de.correo.dominio.Mail
import org.uqbar.listas.de.correo.dominio.TipoDeEnvio
import org.uqbar.listas.de.correo.dominio.stateless.excepciones.EnvioNoPermitidoException

class TipoDeEnvioRestringido implements TipoDeEnvio{
	
	override enviarCorreo(Mail mensaje, ListaDeCorreo destino) {
		if( !destino.estaSuscripto(mensaje.remitente)){
			throw new EnvioNoPermitidoException(mensaje, destino);
		}
		
		destino.recibirMail(mensaje)
	}
	
}