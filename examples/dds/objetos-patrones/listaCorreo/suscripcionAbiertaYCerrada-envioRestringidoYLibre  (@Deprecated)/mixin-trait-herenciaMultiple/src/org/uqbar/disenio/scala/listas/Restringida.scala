package org.uqbar.disenio.scala.listas
import scala.collection.mutable.ListBuffer
import org.uqbar.disenio.scala.emails.EmailSender

trait Restringida extends Libre {
  
  
  override def enviar(post:Post) {
    if(!this.remitentePertence(post)) {
      //todo pasar los parametros al mensaje de error
      throw new RuntimeException("El remitente no pertenece a esta lista");
    }
    super.enviar(post);
  }
  
  def remitentePertence(post:Post):Boolean = {
		return miembros.exists(miembro => (miembro.esRemitente(post)));
  }

}