
import uqbar.scala.ejemplos.scala.manejoDeProyectos.modelo.Tarea
import uqbar.scala.ejemplos.scala.manejoDeProyectos.modelo.complejidad.Minima

object manejoDeProyectos {
	import uqbar.scala.ejemplos.scala.manejoDeProyectos.modelo.Proyecto
	import uqbar.scala.ejemplos.scala.manejoDeProyectos.modelo.Tarea
	import uqbar.scala.ejemplos.scala.manejoDeProyectos.modelo.complejidad.Minima
	import uqbar.scala.ejemplos.scala.manejoDeProyectos.modelo.complejidad.Media
	import uqbar.scala.ejemplos.scala.manejoDeProyectos.modelo.complejidad.Maxima
  
  val iteracion1 : Tarea = new Tarea(5, new Media)//> iteracion1  : uqbar.scala.ejemplos.scala.manejoDeProyectos.modelo.Tarea = Ti
                                                  //| empo: 5
  val iteracion2 : Tarea = new Tarea(2, new Minima)
                                                  //> iteracion2  : uqbar.scala.ejemplos.scala.manejoDeProyectos.modelo.Tarea = Ti
                                                  //| empo: 2
  val iteracion3 : Tarea = new Tarea(20, new Maxima)
                                                  //> iteracion3  : uqbar.scala.ejemplos.scala.manejoDeProyectos.modelo.Tarea = Ti
                                                  //| empo: 20
  
  
  val relevamiento:Tarea = new Tarea(10,new Minima)
                                                  //> relevamiento  : uqbar.scala.ejemplos.scala.manejoDeProyectos.modelo.Tarea = 
                                                  //| Tiempo: 10
	relevamiento.costo                        //> res0: Double = 250.0
	relevamiento.costoTotal                   //> res1: Double = 250.0
	
  val desarrollo:Tarea = new Tarea(30,new Media,List(iteracion1,iteracion2,iteracion3))
                                                  //> desarrollo  : uqbar.scala.ejemplos.scala.manejoDeProyectos.modelo.Tarea = Ti
                                                  //| empo: 30
  desarrollo.costo                                //> res2: Double = 787.5
  desarrollo.costoTotal                           //> res3: Double = 1403.75
  desarrollo.tiempo                               //> res4: Double = 30.0
  desarrollo.tiempoTotal                          //> res5: Double = 57.0
  
  
  
  val sucursalCentral:Tarea = new Tarea(2,new Minima)
                                                  //> sucursalCentral  : uqbar.scala.ejemplos.scala.manejoDeProyectos.modelo.Tare
                                                  //| a = Tiempo: 2
	val sucursalLiniers:Tarea = new Tarea(3,new Media)
                                                  //> sucursalLiniers  : uqbar.scala.ejemplos.scala.manejoDeProyectos.modelo.Tare
                                                  //| a = Tiempo: 3
  
  val implementacion:Tarea = new Tarea(2,new Maxima,List(sucursalCentral, sucursalLiniers))
                                                  //> implementacion  : uqbar.scala.ejemplos.scala.manejoDeProyectos.modelo.Tarea
                                                  //|  = Tiempo: 2
  implementacion.costo                            //> res6: Double = 53.5
  implementacion.costoTotal                       //> res7: Double = 182.25
  
  val webmail21 : Proyecto = new Proyecto (List(relevamiento, desarrollo, implementacion ) )
                                                  //> webmail21  : uqbar.scala.ejemplos.scala.manejoDeProyectos.modelo.Proyecto =
                                                  //|  uqbar.scala.ejemplos.scala.manejoDeProyectos.modelo.Proyecto@2b5ac3c9
  webmail21.costo                                 //> res8: Double = 1836.0
 


  //Saber el costo de la tarea Relevamiento
  relevamiento costo                              //> res9: Double = 250.0
  
  //Calcular las tareas con tiempo < 10
  webmail21.tareasCortas                          //> res10: List[uqbar.scala.ejemplos.scala.manejoDeProyectos.modelo.Tarea] = Li
                                                  //| st(Tiempo: 2)
  //Saber el costo del proyecto de ejemplo
  webmail21.costo                                 //> res11: Double = 1836.0
  
  //Conocer las tareas que tengan más de 2 subtareas (sólo la Tarea "Desarrollo")
  webmail21.tareasComplejas                       //> res12: List[uqbar.scala.ejemplos.scala.manejoDeProyectos.modelo.Tarea] = Li
                                                  //| st(Tiempo: 30)
  
}