package org.uqbar.listas.de.correo.dominio

/**
 * Strategy que representa la manera en la que se envia un mail a una lista
 */
interface TipoDeEnvio {
	
	def void enviarCorreo(Mail mensaje, ListaDeCorreo destinatario)
	
}