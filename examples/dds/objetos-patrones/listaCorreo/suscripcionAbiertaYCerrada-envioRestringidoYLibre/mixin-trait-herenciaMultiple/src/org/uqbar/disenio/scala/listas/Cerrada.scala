package org.uqbar.disenio.scala.listas
import scala.collection.mutable.MutableList
import scala.collection.mutable.ListBuffer

trait Cerrada extends Lista{

 var miembrosPendientes: ListBuffer[Miembro] = new ListBuffer[Miembro]()
 
 def suscribir(miembro:Miembro) {
   this.miembrosPendientes += miembro
 }
 
 def aprobar(miembro:Miembro) {
   miembrosPendientes -= miembro
   miembros += miembro
 }
 
 def rechazar(miembro:Miembro) {
   miembrosPendientes -= miembro
 }
 
 
}