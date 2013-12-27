package ar.edu.telefonia.appModel

import ar.edu.telefonia.domain.Abonado
import ar.edu.telefonia.home.HomeTelefonia
import java.util.List
import org.uqbar.commons.utils.Observable

@Observable
class BuscarAbonadoAppModel {
	@Property BusquedaAbonados busquedaAbonados
	@Property List<Abonado> abonados
	HomeTelefonia homeTelefonia = HomeTelefonia.instance
	
	def void buscar() {
		abonados = homeTelefonia.getAbonados(busquedaAbonados)
	}
	
	def void limpiar() {
		busquedaAbonados.clear()
	}
}