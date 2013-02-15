package ar.edu.manejoProyectos;

@Deprecated  
//Use TipoTarea instead
public interface TipoDeTarea {

	public double getCosto(Tarea tarea);
	public double getCostoTotal(Tarea tarea);
	public void agregarSubtarea(Tarea tarea);
	
}
