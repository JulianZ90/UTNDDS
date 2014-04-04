package org.uqbar.disenio.scala.listas
import java.util.ArrayList
import scala.collection.mutable.ListBuffer

trait Abierta extends Lista{

 def suscribir(miembro:Miembro) {
   this.miembros += miembro
 }
 
	 
  
}