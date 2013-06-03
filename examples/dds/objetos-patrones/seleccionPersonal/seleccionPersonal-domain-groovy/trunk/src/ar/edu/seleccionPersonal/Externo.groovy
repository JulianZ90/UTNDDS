package ar.edu.seleccionPersonal

class Externo extends Postulante {
	List<String> cargos
	
	public Externo() {
		cargos = []
	}
	
	def validarPostulacion(BusquedaInterna interna) {
		throw new UnsupportedOperationException("No está permitido postularse a los externos a una búsqueda interna")
	}

	def validarPostulacion(BusquedaExterna externa) {
		// ok
	}

	def validarPostulacion(BusquedaEspecial especial) {
		cargos.contains(especial.descripcionCargo)
	}
	
}
