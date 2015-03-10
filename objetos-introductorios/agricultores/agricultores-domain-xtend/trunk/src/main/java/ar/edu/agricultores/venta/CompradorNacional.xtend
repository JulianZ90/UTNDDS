package ar.edu.agricultores.venta

import ar.edu.agricultores.venta.Comprador
import ar.edu.agricultores.venta.Venta

class CompradorNacional extends Comprador {
	
	override coeficienteAjuste(Venta venta) {
		if (venta.cantidadKilos > 500) {
			0.1
		} else {
			0
		}
	}
	
}