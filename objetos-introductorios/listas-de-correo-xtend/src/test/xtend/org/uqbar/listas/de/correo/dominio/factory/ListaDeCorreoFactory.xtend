package org.uqbar.listas.de.correo.dominio.factory

import org.uqbar.listas.de.correo.dominio.ListaDeCorreo
import org.uqbar.listas.de.correo.dominio.stateless.tipoEnvio.TipoDeEnvioLibre
import org.uqbar.listas.de.correo.dominio.statefull.tipoSuscripcion.SuscripcionAbierta
import org.uqbar.listas.de.correo.dominio.stateless.tipoEnvio.TipoDeEnvioRestringido
import org.uqbar.listas.de.correo.dominio.statefull.tipoSuscripcion.SuscripcionCerrada

class ListaDeCorreoFactory {
	
	def static crearListaAbiertaLibre() {
		var lista = new ListaDeCorreo(new TipoDeEnvioLibre)
		lista.setTipoDeSuscripcion(new SuscripcionAbierta(lista))
		lista
	}
	
	def static crearListaAbiertaRestringida() {
		var lista = new ListaDeCorreo(new TipoDeEnvioRestringido)
		lista.setTipoDeSuscripcion(new SuscripcionAbierta(lista))
		lista
	}
	
	def static crearListaAbierta(){
		var lista = new ListaDeCorreo(new TipoDeEnvioLibre)
		lista.setTipoDeSuscripcion(new SuscripcionAbierta(lista))
		lista
	}
	
	def static crearListaCerrada(){
		var lista = new ListaDeCorreo(new TipoDeEnvioLibre)
		lista.setTipoDeSuscripcion(new SuscripcionCerrada(lista))
		lista
	}
	
	
	
}