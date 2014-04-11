package org.uqbar.listas.de.correo.dominio.tipoSuscripcion

import org.uqbar.listas.de.correo.dominio.tipoSuscripcion.TipoDeSuscripcion
import org.uqbar.listas.de.correo.dominio.Usuario
import org.uqbar.listas.de.correo.dominio.ListaDeCorreo

class SuscripcionAbierta implements TipoDeSuscripcion {
	
	override suscribir(Usuario usuario, ListaDeCorreo lista) {
		lista.agregarUsuario(usuario)
	}
	
}