package org.uqbar.listas.de.correo.dominio.stateless.tipoEnvio

import org.uqbar.listas.de.correo.dominio.ListaDeCorreo
import org.uqbar.listas.de.correo.dominio.Mail
import org.uqbar.listas.de.correo.dominio.TipoDeEnvio

/**
 * Cualquiera puede mandar correos a la lista
 */
class TipoDeEnvioLibre implements TipoDeEnvio{
	
	override enviarCorreo(Mail mensaje, ListaDeCorreo destino) {
		destino.recibirMail(mensaje)
	}
	
}