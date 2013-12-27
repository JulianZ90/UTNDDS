package ar.edu.telefonia.appModel

import ar.edu.telefonia.domain.Abonado
import org.uqbar.commons.utils.Observable

@Observable
class BusquedaAbonados {
	@Property String nombreDesde
	@Property String nombreHasta
	@Property boolean soloMorosos
	
	new() {
		clear()	
	}
	
	def cumple(Abonado abonado) {
		(nombreDesde == null || nombreDesde > abonado.nombre) && 
		(nombreHasta == null || nombreHasta < abonado.nombre) &&
		(!soloMorosos || abonado.esMoroso)
	}
	
	def clear() {
		nombreDesde = ""
		nombreHasta = ""
		soloMorosos = false
	}
	
}