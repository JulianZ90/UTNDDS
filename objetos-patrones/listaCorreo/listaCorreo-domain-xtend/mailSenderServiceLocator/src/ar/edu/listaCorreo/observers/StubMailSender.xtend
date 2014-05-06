package ar.edu.listaCorreo.observers

import java.util.HashMap
import java.util.HashSet
import java.util.Map
import java.util.Set

class StubMailSender implements MessageSender {
	Map<String, Set<String>> mailsEnviados

	override send(Mail mail) {
		simularEnvioMail(mail.from, mail.message)
		println("Simulación envío de mail | From: " + mail.from + " | To: " + mail.to + " | Message: " + mail.message)
	}

	def simularEnvioMail(String from, String message) {
		var mensajes = mailsDe(from)
		mensajes.add(message)
		mailsEnviados.put(from, mensajes)
	}

	def Set<String> mailsDe(String from) {
		var Set<String> mensajes = mailsEnviados.get(from)
		if (mensajes == null) {
			mensajes = new HashSet<String>
		}
		mensajes
	}

	new() {
		mailsEnviados = new HashMap<String, Set<String>>
	}

}
