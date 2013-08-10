package org.uqbar.comunicacion.mailSender.singleton

class MailSender {
	var static MailSender instance
	
	public static def getInstance(){
		 if(instance == null){
		 	instance = new MailSender 
		 }
		 return instance
	}
	
	def sendMail(String text) {
		// ... 
	}
}