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
	Collection<Usuario> pendientes
	
	new(TipoDeSuscripcion tipo){
		suscriptos = new ArrayList
		pendientes = new ArrayList
		tipoDeSuscripcion = tipo
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

}