package ar.edu.manejoProyectos

import java.util.ArrayList
import java.util.Collection
import org.eclipse.xtend.lib.Property

class Tarea {
	
	@Property int tiempo
	@Property Complejidad complejidad
	@Property Collection<Impuesto> impuestos
	@Property TipoTarea tipoDeTarea

	new() {
		tiempo = 0
		complejidad = new ComplejidadMinima
		impuestos = new ArrayList<Impuesto>
		tipoDeTarea = new TareaSimple
	}
	
	def double getCosto() {
		tipoDeTarea.getCosto(this)
	}
	
	def double getCostoTotal() {
		tipoDeTarea.getCostoTotal(this)
	}
	
	def double getCostoBase() {
		val costoComplejidad = complejidad.getCosto(this)
		costoComplejidad + this.getCostoImpositivo(costoComplejidad)	
	}

	def double getCostoImpositivo(double costo) {
		impuestos.fold (0.0) [ acum, impuesto | acum + impuesto.getCostoImpositivo(costo) ]
	}

	def void setCompuesta() {
		tipoDeTarea = new TareaCompuesta
	}
	
	def void setSimple() {
		tipoDeTarea = new TareaSimple
	}

	def void agregarSubtarea(Tarea tarea) {
		tipoDeTarea.agregarSubtarea(tarea)
	}

}