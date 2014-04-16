package org.uqbar.listas.de.correo.dominio.statefull.tipoSuscripcion

import org.uqbar.listas.de.correo.dominio.TipoDeSuscripcion
import org.uqbar.listas.de.correo.dominio.Usuario
import org.uqbar.listas.de.correo.dominio.ListaDeCorreo

class SuscripcionAbierta extends TipoDeSuscripcion {
	
	new(ListaDeCorreo lista) {
		super(lista)
	}
	
	override suscribir(Usuario usuario) {
		lista.agregarUsuario(usuario)
	}
	
}