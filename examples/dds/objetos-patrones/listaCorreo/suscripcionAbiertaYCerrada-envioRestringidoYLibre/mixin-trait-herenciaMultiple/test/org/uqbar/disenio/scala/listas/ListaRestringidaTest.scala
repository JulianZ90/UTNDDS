package org.uqbar.disenio.scala.listas
import org.junit.Test
import org.junit.Assert
import org.junit.Before
import org.junit.After
import org.uqbar.disenio.scala.emails.EmailSender

class ListaRestringidaTest {

  
  EmailSenderProvider.emailSender = EmailSenderMock
  val leo = new Miembro("lgassman@gmail.com")
  val nico = new Miembro("npasserini@gmail.com")
  val pablo = new Miembro("tesonep@gmail.com")
  val listaCerradaRestringida = new ListaCerradaRestringida
  listaCerradaRestringida.miembros ++= List(leo, nico, pablo)

  val listaAbiertaRestringida = new ListaAbiertaRestringida
  listaAbiertaRestringida.miembros ++= List(leo, nico, pablo)

  @After
  def after = EmailSenderMock.clear
  
  @Test
  def testEnvioMiembro = {
	  this.envioMiembro(listaCerradaRestringida)
	  this.envioMiembro(listaAbiertaRestringida)
  }
  
 @Test(expected=classOf[RuntimeException])
  def testEnvioNoMiembroCerrado = envioNoMiembro(listaCerradaRestringida)
  
 
 @Test(expected=classOf[RuntimeException])
  def testEnvioNoMiembroAbierto =  envioNoMiembro(listaAbiertaRestringida)
  
  
  def envioMiembro(lista:Lista) {
    val post:Post = new Post(leo.mailDefault, "hola", "yeah");
    lista.enviar(post);
    EmailSenderMock.assertPost("se esperaban dos emails", 2, post);
    EmailSenderMock.clear();
  }
  
  def envioNoMiembro(lista:Lista) {
    val post:Post = new Post("fulano@gmail.com", "hola", "yeah");
    lista.enviar(post);
  }
  
}