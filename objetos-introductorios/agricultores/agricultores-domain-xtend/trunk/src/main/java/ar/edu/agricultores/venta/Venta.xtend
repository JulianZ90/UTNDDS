package ar.edu.agricultores.venta

import ar.edu.agricultores.Parcela
import java.util.Date
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Venta {
	
	Date fechaVenta
	Parcela parcela
	int cantidadKilos
	Comprador comprador
	
	// PUNTO 3
	def precio() {
		parcela.precioVenta * cantidadKilos * coeficienteAjuste
	}
	
	def double coeficienteAjuste() { 
		1 + comprador.coeficienteAjuste(this)
	}

	def cultivo() {
		parcela.cultivo
	} 
	
}