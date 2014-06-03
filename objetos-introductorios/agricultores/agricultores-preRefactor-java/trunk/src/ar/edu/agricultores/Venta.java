package ar.edu.agricultores;

import java.util.Date;
import java.util.List;

public class Venta {

	Date fechaVenta;
	Parcela parcela;
	int cantidadKilos;
	Date fechaNacimientoComprador;
	String nombreComprador;
	String tipoComprador;
	List<Cultivo> cultivosSinRecargo;

	public static double COEFICIENTE_PARA_EXTRANJEROS = 0.4;

	// PUNTO 3
	public double precio() {
		return cantidadKilos * this.precioVentaDeLaParcela(this.parcela) * (1 + this.coeficienteDeAjuste());
	}

	public double precioVentaDeLaParcela(Parcela unaParcela) {
		return unaParcela.precioVenta();
	}

	public double coeficienteDeAjuste() {
		if (tipoComprador == "N") { // Nacional
			if (cantidadKilos > 500) {
				return 0.1;
			}
		}
		if (tipoComprador == "E") { // Extranjero
			return COEFICIENTE_PARA_EXTRANJEROS;
		}
		if (tipoComprador == "S") { // Especial
			if (cultivosSinRecargo.contains(parcela.cultivo)) {
				return 0.05;
			}
		}
		return 0.0d;
	}

}
