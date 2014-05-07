package org.uqbar.listas.de.correo.adapter.envioDeMails

import enviadorDeMails.distribuidor.DistribuidorDeMailsSuperPerfomanteYSeguro
import java.util.Date
import org.uqbar.listas.de.correo.dominio.Cartero
import org.uqbar.listas.de.correo.dominio.Mail
import org.uqbar.listas.de.correo.dominio.Usuario
import enviadorDeMails.excepciones.NoSePuedenMandarMailsEnElFututo
import org.uqbar.listas.de.correo.dominio.stateless.excepciones.MailMalRedactadoException
import enviadorDeMails.excepciones.NoSePuedenMandarMailsPocoDescriptivos
import enviadorDeMails.excepciones.NoSePudoEnviarElMail
import org.uqbar.listas.de.correo.dominio.stateless.excepciones.ErrorEnElEnvioException

class CarteroDistribuidor implements Cartero {
	
	override enviarMail(Mail mail, Usuario destinatario) {
		var distribuidorSeguro = new DistribuidorDeMailsSuperPerfomanteYSeguro
		
		try{
			distribuidorSeguro.dispararMensajeALasDirecciones(
				new UsuarioEnviador(mail.remitente),
				new UsuarioReceptor(destinatario, mail.remitente),
				new Date(),
				mail.getTitulo,
				mail.getTexto,
				false,
				false);
		}catch(NoSePuedenMandarMailsEnElFututo e){
			throw new MailMalRedactadoException(mail,"La fecha debe ser anterior a la actual",e)
		}catch(NoSePuedenMandarMailsPocoDescriptivos e){
			throw new MailMalRedactadoException(mail,"El asunto debe ser mas extenso",e)
		}catch(NoSePudoEnviarElMail e){
			throw new ErrorEnElEnvioException(mail, "No se puede enviar el mail", e)
		}
	}
	
}