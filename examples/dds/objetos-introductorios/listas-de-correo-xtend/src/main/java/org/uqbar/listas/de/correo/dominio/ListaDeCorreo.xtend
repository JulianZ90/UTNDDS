package org.uqbar.listas.de.correo.dominio

import java.util.Collection
import java.util.ArrayList
import org.uqbar.listas.de.correo.dominio.tipoSuscripcion.TipoDeSuscripcion

class ListaDeCorreo {
	
	Collection<Usuario> suscriptos
	TipoDeSuscripcion tipoDeSuscripcion
	
	new(TipoDeSuscripcion tipo){
		suscriptos = new ArrayList
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
}