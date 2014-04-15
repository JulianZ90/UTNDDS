package org.uqbar.listas.de.correo.dominio

import org.uqbar.listas.de.correo.dominio.stateless.ListaDeCorreoStateless

interface TipoDeSuscripcion {
	
	def void suscribir(Usuario usuario, ListaDeCorreoStateless lista)
	
}