package enviadorDeMails;

import java.util.Date;

import enviadorDeMails.excepciones.NoSePudoEnviarElMail;
import enviadorDeMails.excepciones.NoSePuedenMandarMailsEnElFututo;
import enviadorDeMails.excepciones.NoSePuedenMandarMailsPocoDescriptivos;

public interface DistribuidorDeMails {

	
	/**
	 * Envia el mail a destino
	 * @param emisor: quien envia el mail
	 * @param usuario: quien recibe el mail
	 * @param fechaDeEnvio: fecha del mensaje
	 * @param subject: asunto
	 * @param body: contenido
	 * @param estaFirmado: true si le adosaron un certificado
	 * @param tieneImagenes: true si en el contenido trae imagenes
	 * @throws NoSePuedenMandarMailsEnElFututo: En caso de que se pase una fecha superior a hoy
	 * @throws NoSePuedenMandarMailsPocoDescriptivos: En caso de que el subject no cumpla con nuestros parametros de calidad
	 * @throws NoSePudoEnviarElMail: En cualquier otro caso
	 */
	public void dispararMensajeALasDirecciones(
			EnviadorDeMails emisor, 
			RecibidorDeMails usuario, 
			Date fechaDeEnvio, 
			String subject, 
			String body, 
			boolean estaFirmado,
			boolean tieneImagenes ) throws NoSePuedenMandarMailsEnElFututo, NoSePuedenMandarMailsPocoDescriptivos, NoSePudoEnviarElMail;

}