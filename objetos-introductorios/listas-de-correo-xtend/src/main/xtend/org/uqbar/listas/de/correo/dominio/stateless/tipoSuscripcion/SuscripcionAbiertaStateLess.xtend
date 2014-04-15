package org.uqbar.listas.de.correo.dominio.stateless.tipoSuscripcion

import org.uqbar.listas.de.correo.dominio.TipoDeSuscripcion
import org.uqbar.listas.de.correo.dominio.Usuario
import org.uqbar.listas.de.correo.dominio.stateless.ListaDeCorreoStateless

class SuscripcionAbiertaStateLess implements TipoDeSuscripcion {
	
	override suscribir(Usuario usuario, ListaDeCorreoStateless lista) {
		lista.agregarUsuario(usuario)
	}
	
}