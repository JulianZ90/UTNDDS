package org.uqbar.listas.de.correo.dominio.tipoSuscripcion

import org.uqbar.listas.de.correo.dominio.ListaDeCorreo
import org.uqbar.listas.de.correo.dominio.Usuario

interface TipoDeSuscripcion {
	
	def void suscribir(Usuario usuario, ListaDeCorreo lista)
	
}