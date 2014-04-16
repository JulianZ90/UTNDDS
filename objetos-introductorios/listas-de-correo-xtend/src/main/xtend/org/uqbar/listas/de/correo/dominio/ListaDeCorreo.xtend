package org.uqbar.listas.de.correo.dominio

import java.util.ArrayList
import java.util.Collection
import org.uqbar.listas.de.correo.dominio.TipoDeSuscripcion
import org.uqbar.listas.de.correo.dominio.Usuario

/**
 * Una lista de correo representa a un conjunto de usuarios que reciben los mails que se envian a la lista
 */
class ListaDeCorreo {
	
	Collection<Usuario> suscriptos
	@Property
	TipoDeSuscripcion tipoDeSuscripcion
	TipoDeEnvio tipoDeEnvio
	
	new(TipoDeEnvio envio){
		suscriptos = new ArrayList
		tipoDeEnvio = envio
	}
	
	/**
	 * suscribe a un usuario a traves del proceso de suscripcion que corresponda
	 */
	def suscribir(Usuario usuario){
		tipoDeSuscripcion.suscribir(usuario)
	}

	/**
	 * agrega el usuario a su lista de suscriptos
	 * A menos que seas el TipoDeSuscripcion no queres llamar a este mensaje
	 */
	def agregarUsuario(Usuario usuario) {
		suscriptos.add(usuario)
	}

	
	def estaSuscripto(Usuario usuario) {
		suscriptos.contains(usuario)
	}

	def enviarMail(Mail mail){
		this.tipoDeEnvio.enviarCorreo(mail, this)
	}
	
	def void recibirMail(Mail mail) {
		this.suscriptos.forEach[suscripto | this.enviarMail(mail, suscripto) ]
	}
	
	
	def enviarMail(Mail mail, Usuario suscripto){
		//FIXME: Aca deberiamos de enviar el mail realmente y no como pasa ahora
		suscripto.recibirMail(mail)
	}
	

}