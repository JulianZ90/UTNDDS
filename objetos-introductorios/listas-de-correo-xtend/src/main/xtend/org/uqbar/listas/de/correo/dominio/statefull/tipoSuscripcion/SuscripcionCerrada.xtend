package org.uqbar.listas.de.correo.dominio.statefull.tipoSuscripcion

import java.util.ArrayList
import java.util.Collection
import org.uqbar.listas.de.correo.dominio.ListaDeCorreo
import org.uqbar.listas.de.correo.dominio.TipoDeSuscripcion
import org.uqbar.listas.de.correo.dominio.Usuario

class SuscripcionCerrada extends TipoDeSuscripcion{
	
	Collection<Usuario> pendientes
	
	new(ListaDeCorreo lista){
		super(lista)
		pendientes = new ArrayList
	}
	
	override suscribir(Usuario usuario) {
		pendientes.add(usuario)
	}
	
	override estaPendiente(Usuario usuario) {
		pendientes.contains(usuario)
	}
	
	override aprobar(Usuario usuario) {
		if(this.estaPendiente(usuario)){
			pendientes.remove(usuario)
			lista.agregarUsuario(usuario)
		}else{
			/**
			 * TODO
			 *  QUE HACEMOS????! 
			 * Queremos aprobar un usuario que no esta pendiente!
			 */
		}
	}
	
	
}