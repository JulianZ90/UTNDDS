package org.uqbar.listas.de.correo.dominio.stateless.tipoEnvio

import org.uqbar.listas.de.correo.dominio.TipoDeEnvio
import org.uqbar.listas.de.correo.dominio.Mail
import org.uqbar.listas.de.correo.dominio.ListaDeCorreo

class TipoDeEnvioRestringido implements TipoDeEnvio{
	
	override enviarCorreo(Mail mensaje, ListaDeCorreo destino) {
		if( !destino.estaSuscripto(mensaje.remitente)){
			/**
			 * TODO: No esta suscripto no tenemos que dejarlo!!!!!!!! 
			 */
			return ;
		}
		
		destino.recibirMail(mensaje)
	}
	
}