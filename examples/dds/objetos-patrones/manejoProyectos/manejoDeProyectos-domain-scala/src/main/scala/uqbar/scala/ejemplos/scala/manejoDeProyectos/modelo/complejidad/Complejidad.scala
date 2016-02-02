package uqbar.scala.ejemplos.scala.manejoDeProyectos.modelo.complejidad

import uqbar.scala.ejemplos.scala.manejoDeProyectos.modelo.Tarea

abstract class Complejidad {
	def costo(tarea:Tarea):Double
}

class Minima extends Complejidad{
  def costo(tarea:Tarea):Double={tarea.tiempo * 25}
}

class Media extends Complejidad{
  def costo(tarea:Tarea):Double={tarea.tiempo * 25 * 1.05}
}

class Maxima extends Complejidad{
  def costo(tarea:Tarea):Double={
	  val costoBase:Double = tarea.tiempo * 25 * 1.07
	  if(tarea.tiempo > 10) costoBase + 10 * (tarea.tiempo-10) else costoBase
    }
}