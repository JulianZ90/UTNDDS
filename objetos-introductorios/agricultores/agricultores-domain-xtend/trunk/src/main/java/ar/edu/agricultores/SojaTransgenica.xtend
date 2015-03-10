package ar.edu.agricultores

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class SojaTransgenica extends Soja {

	boolean puedeSufrirMutaciones
	
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
	
	override String toString() {
		"Soja Transgenica"	
	}
	
}