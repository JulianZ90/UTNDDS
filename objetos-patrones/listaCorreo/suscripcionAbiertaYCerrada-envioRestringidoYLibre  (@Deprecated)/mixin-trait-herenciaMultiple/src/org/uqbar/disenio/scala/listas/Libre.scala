package org.uqbar.disenio.scala.listas
import scala.collection.mutable.ListBuffer
import org.uqbar.disenio.scala.emails.EmailSender

trait Libre extends Lista {

  def enviar(post: Post) {
    miembros.filter(miembro => (!miembro.esRemitente(post))).
    							foreach(miembro => (miembro.enviar(post)))
  }

}