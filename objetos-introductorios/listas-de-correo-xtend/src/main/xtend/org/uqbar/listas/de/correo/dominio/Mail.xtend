package org.uqbar.listas.de.correo.dominio

class Mail {
	@Property
	Usuario remitente
	
	@Property
	String titulo
	
	@Property
	String texto
	
	new(Usuario origen, String titulo, String texto){
		this.remitente = origen
		this.titulo = titulo
		this.texto = texto
	}
	
}