package ar.edu.agricultores

import ar.edu.agricultores.Cultivo
import ar.edu.agricultores.Parcela

class Soja extends Cultivo {
	
	override costoBasePorHectarea(Parcela parcela) {
		10
	}
	
	override precioVentaPorKg(Parcela parcela) {
		this.costoPara(parcela) * 10 * (1 - this.porcentajeDescuento(parcela))
	}
	
	def double porcentajeDescuento(Parcela parcela) { 
		if (parcela.sujetaARetencion()) {
			0.1
		} else {
			0
		}
	}

	
}