package ar.edu.agricultores.venta

import java.util.Date
import org.eclipse.xtend.lib.Property
import ar.edu.agricultores.Parcela

class Venta {
	
	@Property Date fechaVenta
	@Property Parcela parcela
	@Property int cantidadKilos
	@Property Comprador comprador
	
	def montoTotal() {
		parcela.precioVenta * cantidadKilos * coeficienteAjuste
	}
	
	def double coeficienteAjuste() { 
		1 + comprador.coeficienteAjuste(this)
	}

	def cultivo() {
		parcela.cultivo
	} 
	
}