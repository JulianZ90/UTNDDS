package org.uqbar.listas.de.correo.dominio

/**
 * Estrategy para determinar la manera en la que un usuario ingresa a la lista
 */
interface TipoDeSuscripcion {
	
	def void suscribir(Usuario usuario, ListaDeCorreo lista)
	
}