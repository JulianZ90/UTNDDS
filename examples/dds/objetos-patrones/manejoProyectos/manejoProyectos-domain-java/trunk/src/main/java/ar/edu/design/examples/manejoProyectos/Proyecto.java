package ar.edu.design.examples.manejoProyectos;

import java.util.List;

public class Proyecto {

	private List<Tarea> tareas;

	public double getCostoTotal() {
		return this.tareas.stream().mapToDouble(tarea -> tarea.getCostoTotal()).sum();
	}
}
