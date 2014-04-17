package org.uqbar.listas.de.correo.dominio

interface Cartero {
	def void enviarMail(Mail mail, Usuario usuario)
}