package uqbar.scala.ejemplos.scala.manejoDeProyectos.modelo

import uqbar.scala.ejemplos.scala.manejoDeProyectos.modelo.complejidad.Complejidad
import uqbar.scala.ejemplos.scala.manejoDeProyectos.modelo.impuesto.ImpuestoPorPorcentaje

class Tarea (val tiempoTarea:Int, complejidad:Complejidad,val subtareas:List[Tarea]=List(), val impuestos:List[ImpuestoPorPorcentaje]=List()){
  
  //El tiempo de la tarea en particular
   def tiempo() : Double = { tiempoTarea }
  
   //El tiempo total (incluye el tiempo de las subtareas)
   def tiempoTotal():Double={tiempo + subtareas.foldLeft(0.0)((total,tarea) => total + tarea.tiempoTotal)}
   
   //El costo total (incluye el tiempo de las subtareas)
   def costoTotal():Double={costo + subtareas.foldLeft(0.0)((total,tarea) => total + tarea.costoTotal)}
   
   //El costo de la tarea particular
   def costo() : Double = { 
     val costo:Double = complejidad.costo(this)
     var recargoComplejidad : Double = 0
     if(subtareas.size > 3){
       recargoComplejidad = costo * 1.04
     }
     val recargo:Double = impuestos.foldLeft(0.0)((total,impuesto)=>total + impuesto.costoImpositivo(costo + recargoComplejidad))
     costo + recargoComplejidad + recargo
   }
   
   override def toString():String = {"Tiempo: "+tiempoTarea}
   
}