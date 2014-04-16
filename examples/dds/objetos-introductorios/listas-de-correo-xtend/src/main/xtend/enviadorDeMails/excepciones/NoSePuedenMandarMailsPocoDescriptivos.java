package enviadorDeMails.excepciones;

public class NoSePuedenMandarMailsPocoDescriptivos extends RuntimeException {

	private int minimoPermitido;
	private String subject;

	public NoSePuedenMandarMailsPocoDescriptivos(String subject,
			int minimo) {
		super("no podemos mandar mails con subjects poco descriptivos");
		this.subject = subject;
		this.minimoPermitido = minimo;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

}
