package org.uqbar.comunicacion.mailSender.applicationContext

import org.uqbar.comunicacion.Asiento
import org.uqbar.comunicacion.Sala

class SalaEnviaMails extends Sala {
	override def ocupar(Asiento asiento) {
		super.ocupar(asiento)
		if (asientosLibres.empty) {
			mailSender.sendMail("Se llenó la sala")
		}
	}

	override def liberar(Asiento asiento) {
		super.liberar(asiento)
		mailSender.sendMail("Se canceló una reserva")
	}
	
	def mailSender() {
		ApplicationContext.global(MailSender)
	}
}
