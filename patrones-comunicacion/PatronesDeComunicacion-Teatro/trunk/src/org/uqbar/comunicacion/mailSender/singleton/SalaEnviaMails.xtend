package org.uqbar.comunicacion.mailSender.singleton

import org.uqbar.comunicacion.Asiento
import org.uqbar.comunicacion.Sala

class SalaEnviaMails extends Sala {
	override def ocupar(Asiento asiento) {
		super.ocupar(asiento)
		if (asientosLibres.empty) {
			MailSender.instance.sendMail("Se llenó la sala")
		}
	}

	override def liberar(Asiento asiento) {
		super.liberar(asiento)
		MailSender.instance.sendMail("Se canceló una reserva")
	}
}
