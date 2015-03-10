package ar.edu.agricultores

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class SojaTransgenica extends Soja {

	boolean puedeSufrirMutaciones

	new(boolean pPuedeSufrirMutaciones) {
		puedeSufrirMutaciones = pPuedeSufrirMutaciones
	}

	override String toString() {
		"Soja Transgenica"
	}

	// PUNTO 1
	// super.costo(cantidadHectareasCultivadas)  
	// No es un code smell “de libro”, pero uno lo ve en PDP
	override costo(int cantidadHectareasCultivadas) {
		10 * cantidadHectareasCultivadas
	}

	// PUNTO 2
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
