package ar.edu.seleccionPersonalMethodDispatch

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class PersonalPlanta extends Empleado {
	
	Cargo cargo
	
	def sueldo() {
		cargo.sueldo	
	}
	
}