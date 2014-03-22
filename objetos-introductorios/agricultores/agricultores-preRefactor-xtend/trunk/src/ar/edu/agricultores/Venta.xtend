package ar.edu.agricultores

import java.util.Date
import java.util.List

class Venta {

	@Property Date fechaVenta
	@Property Parcela parcela
	@Property int cantidadKilos
	@Property Date fechaNacimientoComprador
	@Property String nombreComprador
	@Property String tipoComprador
	@Property List<Cultivo> cultivosSinRecargo

	public static double COEFICIENTE_PARA_EXTRANJEROS = 0.4

	def precio() {
		cantidadKilos * this.precioVentaDeLaParcela(this.parcela) * (1 + this.coeficienteDeAjuste())
	}

	def double precioVentaDeLaParcela(Parcela unaParcela) {
		unaParcela.precioVenta
	}

	def double coeficienteDeAjuste() {
		if (tipoComprador == "N") { // Nacional
			if (cantidadKilos > 500) {
				return 0.1
			}
		}
		if (tipoComprador == "E") { // Extranjero
			return COEFICIENTE_PARA_EXTRANJEROS
		}
		if (tipoComprador == "S") { // Especial
			if (cultivosSinRecargo.contains(parcela.cultivo)) {
				return 0.05
			}
		}
		return 0.0d
	}

}
