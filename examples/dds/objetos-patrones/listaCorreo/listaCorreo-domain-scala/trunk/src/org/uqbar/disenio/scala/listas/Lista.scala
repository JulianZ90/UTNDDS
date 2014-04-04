package org.uqbar.disenio.scala.listas
import scala.collection.mutable.ListBuffer
import  org.uqbar.disenio.scala.emails.EmailSender

trait Lista {

  val miembros:ListBuffer[Miembro] = new ListBuffer[Miembro]()
  def suscribir(miembro:Miembro)
  def enviar(post:Post)
  
}
class ListaAbiertaLibre extends Abierta with Libre
class ListaAbiertaRestringida extends Abierta with Restringida 
class ListaCerradaLibre extends Cerrada with Libre 
class ListaCerradaRestringida extends Cerrada with Restringida 

