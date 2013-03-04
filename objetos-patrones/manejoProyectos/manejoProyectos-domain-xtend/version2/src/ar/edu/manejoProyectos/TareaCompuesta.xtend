package ar.edu.manejoProyectos

import java.util.List
import java.util.ArrayList

class TareaCompuesta extends TipoTarea {
	
	List<Tarea> subtareas
	
	new() {
		subtareas = new ArrayList<Tarea>()
	}
	
	override double getCosto(Tarea tarea) {
		this.getCostoPorOverhead(tarea.costoBase)
	}

	def double getCostoPorOverhead(double costo) {
		if (this.tieneMuchasTareas()) {
			costo * 1.04
		} else {
			costo
		}
	}

	def boolean tieneMuchasTareas() {
		subtareas.size > 3
	}

	override double getCostoTotal (Tarea tarea) {
		var costo = this.getCosto(tarea)
		subtareas.fold (costo) [ acum, subtarea | acum + subtarea.costoTotal ]
//      el fold reemplaza toda esta construcción
//		for (Tarea subtarea : subtareas) {
//			costo = costo + subtarea.costoTotal
//		}
//		costo
	}

	override void agregarSubtarea(Tarea tarea) {
		subtareas.add(tarea)
	}
	
}