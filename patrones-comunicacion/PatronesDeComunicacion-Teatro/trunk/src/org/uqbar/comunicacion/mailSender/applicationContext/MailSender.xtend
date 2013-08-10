package org.uqbar.comunicacion.mailSender.applicationContext

interface MailSender {
	def void sendMail(String text)
}		

class SimpleMailSender implements MailSender {
	override def sendMail(String text) {
		// ... 
	}
}