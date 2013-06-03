package ar.edu.seleccionPersonal

class PersonalPlanta extends Empleado {

	def validarPostulacion(BusquedaInterna interna) {
		// ok
	}

	def validarPostulacion(BusquedaExterna externa) {
		throw new UnsupportedOperationException("No está permitido postularse a las búsquedas externas a empleados de planta")
	}

	def validarPostulacion(BusquedaEspecial especial) {
		(especial.remuneracion > this.sueldo) && (this.cantidadPersonasACargo >= 10)
	}
	
}
