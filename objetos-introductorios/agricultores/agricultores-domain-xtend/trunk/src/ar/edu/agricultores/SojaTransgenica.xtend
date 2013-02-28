package ar.edu.agricultores

import ar.edu.agricultores.Soja

class SojaTransgenica extends Soja {

	@Property boolean puedeSufrirMutaciones
	
	new(boolean pPuedeSufrirMutaciones) {
		puedeSufrirMutaciones = pPuedeSufrirMutaciones
	}
	
	override precioVentaPorKg(Parcela parcela) {
		val precioVenta = super.precioVentaPorKg(parcela)
		if (puedeSufrirMutaciones) {
			precioVenta / 2	
		} else {
			precioVenta
		}
	}	
}