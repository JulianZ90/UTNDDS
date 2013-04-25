package org.uqbar.disenio.scala.listas
import org.uqbar.disenio.scala.emails.Email
import org.uqbar.disenio.scala.emails.EmailSender

class Miembro(var mailDefault: String, var otrosMails: List[String]) {

  
  def this(mailDefault: String) = { this(mailDefault, List()) }
 

  def esRemitente(post: Post): Boolean = {
    return (mailDefault == post.from) || otrosMails.contains(post.from);
  }

  def enviar(post: Post) {
    EmailSenderProvider.emailSender.send(new Email(post.from, mailDefault, post.subject, post.content));
  }
}