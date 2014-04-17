package org.uqbar.listas.de.correo.dominio

/**
 * Estrategy para determinar la manera en la que un usuario ingresa a la lista
 */
abstract class TipoDeSuscripcion {
	var ListaDeCorreo lista
	
	new (ListaDeCorreo lista){
		this.lista = lista
	}
	
	def getLista(){
		lista
	}
	
	def Boolean estaPendiente(Usuario usuario){
		false
	}
	
	def void aprobar(Usuario usuario){
		
	}
	
	def abstract void suscribir(Usuario usuario)
}