package org.uqbar.disenio.scala.listas

import org.uqbar.disenio.scala.emails.EmailSender
import org.uqbar.disenio.scala.emails.Email
import scala.collection.mutable.ListBuffer
import org.junit.Assert

object EmailSenderMock extends EmailSender {

  val emails: ListBuffer[Email] = new ListBuffer()
  override def send(email: Email) {
    emails += email
  }

  def assertPost(message: String, cantidad: Integer, post: Post) {
    try {
      Assert.assertEquals(message, cantidad,
      emails.count(email => (email.content == post.content && email.subject == post.subject && email.from == post.from)))
    }
    finally {
      this.clear();
    }
  }
  
  def clear() {
    emails.clear()
  }

}