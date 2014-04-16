package enviadorDeMails;

import java.util.Date;

public interface RecibidorDeMails {

	void recibirMail(EnviadorDeMails emisor, String subject, String body,boolean estaFirmado, Date fechaDeEnvio);

}
