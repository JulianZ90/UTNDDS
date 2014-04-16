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
	TipoDeSuscripcion tipoDeSuscripcion
	TipoDeEnvio tipoDeEnvio
	
	/**
	 * Esto se usa solo si la suscripcion es cerrada 
	 * TODO: Preguntar ¿está bien que quede asi? ¿Estamos seguros de elegir stateless despues de todo?
	 */
	Collection<Usuario> pendientes
	
	new(TipoDeSuscripcion tipo, TipoDeEnvio envio){
		suscriptos = new ArrayList
		pendientes = new ArrayList
		tipoDeSuscripcion = tipo
		tipoDeEnvio = envio
	}
	
	def suscribir(Usuario usuario){
		tipoDeSuscripcion.suscribir(usuario,this)
	}

	def agregarUsuario(Usuario usuario) {
		suscriptos.add(usuario)
	}

	
	def estaSuscripto(Usuario usuario) {
		suscriptos.contains(usuario)
	}




	def dejarPendienteDeSuscripcion(Usuario usuario) {
		pendientes.add(usuario)
	}
	
	def estaPendiente(Usuario usuario) {
		pendientes.contains(usuario)
	}
	
	def aprobar(Usuario usuario) {
		if(this.estaPendiente(usuario)){
			pendientes.remove(usuario)
			suscriptos.add(usuario)
		}else{
			//QUE HACEMOS????! 
		}
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