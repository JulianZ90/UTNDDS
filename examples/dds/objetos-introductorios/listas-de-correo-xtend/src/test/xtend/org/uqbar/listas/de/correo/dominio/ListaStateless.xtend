package org.uqbar.listas.de.correo.dominio

import org.uqbar.listas.de.correo.dominio.stateless.ListaDeCorreoStateless
import org.uqbar.listas.de.correo.dominio.stateless.tipoSuscripcion.SuscripcionAbiertaStateLess
import org.uqbar.listas.de.correo.dominio.stateless.tipoSuscripcion.SuscripcionCerradaStateLess

class ListaStateless extends ListaDeCorreoTest {
	override crearListaAbierta() {
		new ListaDeCorreoStateless(new SuscripcionAbiertaStateLess)
	}
	
	override crearListaCerrada() {
		new ListaDeCorreoStateless(new SuscripcionCerradaStateLess)
	}
	
	
}