package ar.edu.manejoProyectos

abstract class TipoTarea {
	
	def double getCosto(Tarea tarea)
	def double getCostoTotal(Tarea tarea)
	def void agregarSubtarea(Tarea tarea)
	
}