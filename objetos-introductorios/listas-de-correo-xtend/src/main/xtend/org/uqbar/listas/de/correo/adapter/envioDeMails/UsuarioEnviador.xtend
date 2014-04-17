package org.uqbar.listas.de.correo.adapter.envioDeMails

import enviadorDeMails.EnviadorDeMails
import org.uqbar.listas.de.correo.dominio.Usuario

class UsuarioEnviador implements EnviadorDeMails{
	var Usuario usuario
	
	new(Usuario usuario){
		this.usuario = usuario
	}
	
	
}