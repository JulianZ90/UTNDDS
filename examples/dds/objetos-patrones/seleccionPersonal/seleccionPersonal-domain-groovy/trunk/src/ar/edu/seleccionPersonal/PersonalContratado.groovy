package ar.edu.seleccionPersonal

class PersonalContratado extends Empleado {

	PersonalPlanta jefe
	
	def validarPostulacion(BusquedaInterna interna) {
		if (!interna.sector.equals(this.sector)) {
			throw new UnsupportedOperationException("El contratado pertenece al sector " + this.sector + " y la búsqueda es para el sector " + interna.sector)
		}
	}

	def validarPostulacion(BusquedaExterna externa) {
		externa.antiguedad < 1
	}

	def validarPostulacion(BusquedaEspecial especial) {
		this.cantidadPersonasACargo > 20
	}
	
}
