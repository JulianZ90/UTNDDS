package ar.edu.agricultores

import ar.edu.agricultores.Soja

class SojaTransgenica extends Soja {

	@Property boolean puedeSufrirMutaciones

	// super.costo(cantidadHectareasCultivadas)  
	// No es un code smell “de libro”, pero uno lo ve en PDP
	override costo(int cantidadHectareasCultivadas) {
		10 * cantidadHectareasCultivadas
	}

	new(boolean pPuedeSufrirMutaciones) {
		puedeSufrirMutaciones = pPuedeSufrirMutaciones
	}

	override String toString() {
		"Soja Transgenica"
	}

	override precioVenta(double costoTotal, int totalHectareas, double efecto, double retencion, int topeHectareas) {
		var retencionPosta = 0d
		if (totalHectareas > topeHectareas) {
			retencionPosta = retencion
		}
		val aux = (costoTotal * efecto) * (1 - retencionPosta)
		if (puedeSufrirMutaciones) {
			aux * 0.5
		} else {
			aux
		}
	}

}
