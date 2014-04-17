package org.uqbar.listas.de.correo.dominio

import java.util.HashSet
import java.util.Set
import org.uqbar.listas.de.correo.adapter.envioDeMails.CarteroDistribuidor

/**
 * Una lista de correo representa a un conjunto de usuarios que reciben los mails que se envian a la lista
 */
class ListaDeCorreo {
	
	//Es un set porque NO QUEREMOS suscriptos repetidos
	Set<Usuario> suscriptos
	@Property
	TipoDeSuscripcion tipoDeSuscripcion
	TipoDeEnvio tipoDeEnvio
	
	Cartero cartero
	
	new(TipoDeEnvio envio){
		suscriptos = new HashSet
		tipoDeEnvio = envio
		cartero = new CarteroDistribuidor
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
		cartero.enviarMail(mail, suscripto)		
	}
	
	def getSuscriptos(){
		suscriptos
	}

}