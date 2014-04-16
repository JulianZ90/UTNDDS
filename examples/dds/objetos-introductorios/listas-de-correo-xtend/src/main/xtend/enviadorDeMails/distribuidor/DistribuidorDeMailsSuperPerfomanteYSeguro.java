package enviadorDeMails.distribuidor;

import java.util.Date;
import java.util.GregorianCalendar;

import enviadorDeMails.DistribuidorDeMails;
import enviadorDeMails.EnviadorDeMails;
import enviadorDeMails.RecibidorDeMails;
import enviadorDeMails.excepciones.NoSePuedenMandarMailsEnElFututo;
import enviadorDeMails.excepciones.NoSePuedenMandarMailsPocoDescriptivos;

public class DistribuidorDeMailsSuperPerfomanteYSeguro implements DistribuidorDeMails {
	
	private static final int MINIMO_PERMITIDO_DE_SUBJECT = 20;

	public void dispararMensajeALasDirecciones(
			EnviadorDeMails emisor, RecibidorDeMails usuario, 
			Date fechaDeEnvio, String subject, String body, boolean estaFirmado,
			boolean tieneImagenes ){
		Date anioQueViene = new GregorianCalendar(2015,17,04).getTime();
		
		if(fechaDeEnvio.after(anioQueViene)){
			throw new NoSePuedenMandarMailsEnElFututo(fechaDeEnvio);
		}
		
		if(subject.length() < MINIMO_PERMITIDO_DE_SUBJECT){
			throw new NoSePuedenMandarMailsPocoDescriptivos(subject, MINIMO_PERMITIDO_DE_SUBJECT);
		}
		
		
		usuario.recibirMail(emisor, subject, body, estaFirmado, fechaDeEnvio);
		
		
	}
	

}
