package uqbar.scala.ejemplos.scala.manejoDeProyectos.modelo

class Proyecto(val tareas : List[Tarea]) {
  
  def tiempo() : Double = {tareas.foldLeft(0.0)((total,tarea) => total + tarea.tiempoTotal)}
  
  def costo() : Double = {tareas.foldLeft(0.0)((total,tarea) => total + tarea.costoTotal)}
  
  def tareasCortas() : List[Tarea] = {tareas.filter(_.tiempoTotal < 10)}
  
  def tareasComplejas() : List[Tarea] = {tareas.filter(_.subtareas.size > 2)}
}