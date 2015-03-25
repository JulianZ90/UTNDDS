package ar.edu.design.examples.manejoProyectos;

import java.util.ArrayList;
import java.util.List;

public class TareaCompuesta implements TipoDeTarea {

	private List<Tarea> subtareas;
	
	public TareaCompuesta() {
		this.subtareas = new ArrayList<Tarea>();
	}
	
	public double getCosto(Tarea tarea) {
		double costo = tarea.getCostoBase();		
		costo = this.getCostoPorOverhead(costo);
		return costo;
	}

	private double getCostoPorOverhead(double costo) {
		if (this.tieneMuchasTareas()) {
			costo = costo * 1.04;
		}
		return costo;
	}

	private boolean tieneMuchasTareas() {
		return this.subtareas.size() > 3;
	}

	@Override
	public double getCostoTotal (Tarea tarea) {
		return this.subtareas.stream().mapToDouble(subtarea -> subtarea.getCostoTotal()).sum();
	}

	@Override
	public void agregarSubtarea(Tarea tarea) {
		this.subtareas.add(tarea);
	}

}


