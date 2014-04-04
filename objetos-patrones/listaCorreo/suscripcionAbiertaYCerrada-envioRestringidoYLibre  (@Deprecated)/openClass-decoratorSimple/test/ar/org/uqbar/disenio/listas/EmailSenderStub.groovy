package ar.org.uqbar.disenio.listas

import org.junit.Assert;

class EmailSenderStub {

	def emailsEnviados = []
	
	def send(email) {
		emailsEnviados.add(email);
	}
	
	def assertPostEnviado(mensaje, cantidad, Post post){
		int count = 0 
		for(email in emailsEnviados) {
			if(email.from == post.from && email.subject == email.subject && email.content == post.content) {
				count++;
			}
		}
		Assert.assertEquals(mensaje, cantidad, count);
	}
}
