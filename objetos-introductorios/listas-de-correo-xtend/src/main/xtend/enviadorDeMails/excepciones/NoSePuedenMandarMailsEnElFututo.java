package enviadorDeMails.excepciones;

import java.util.Date;

public class NoSePuedenMandarMailsEnElFututo extends RuntimeException {
	private Date fecha;
	
	public NoSePuedenMandarMailsEnElFututo(Date fechaPretendida){
		super("Se esta queriendo mandar un mail con fecha futura");
		fecha = fechaPretendida;
	}

	public Date getFecha() {
		return fecha;
	}
	

}
