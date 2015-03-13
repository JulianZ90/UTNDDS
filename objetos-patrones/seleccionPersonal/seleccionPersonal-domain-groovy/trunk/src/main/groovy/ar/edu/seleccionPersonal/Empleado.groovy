package ar.edu.seleccionPersonal

import java.util.Date;
import java.util.List;

class Empleado extends Postulante {

	Cargo cargo
	String sector
	List<Postulante> personasACargo
	Date fechaIngreso
	
	public Empleado() {
		personasACargo = []
		fechaIngreso = new Date()
	}
	
	def getAntiguedad(Date ahora) {
		use(groovy.time.TimeCategory) {
			def duration = ahora - fechaIngreso
			((duration.days / 365) as int) + 1
		}
	}
	
	def getAntiguedad() {
		getAntiguedad(new Date())
	}

	def getSueldo() {
		cargo.sueldo
	}
	
	def getCantidadPersonasACargo() {
		personasACargo.size()
	}

}
