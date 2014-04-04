package org.uqbar.disenio.scala.listas
import org.junit.Test
import org.junit.Assert
import org.junit.Before
import org.junit.After
import org.uqbar.disenio.scala.emails.EmailSender

class ListaLibreTest {
  EmailSenderProvider.emailSender = EmailSenderMock
  val leo = new Miembro("lgassman@gmail.com")
  val nico = new Miembro("npasserini@gmail.com")
  val pablo = new Miembro("tesonep@gmail.com")
  val listaCerradaLibre = new ListaCerradaLibre
  listaCerradaLibre.miembros ++= List(leo, nico, pablo)

  val listaAbiertaLibre = new ListaAbiertaLibre
  listaAbiertaLibre.miembros ++= List(leo, nico, pablo)

  @After
  def after = EmailSenderMock.clear

  @Test
  def testEnvioMiembro() {
    envioMiembro(listaCerradaLibre)
    envioMiembro(listaAbiertaLibre)
  }
  
  @Test
  def testEnvioNoMiembro() {
    envioNoMiembro(listaCerradaLibre)
    envioNoMiembro(listaAbiertaLibre)
  }

  def envioMiembro(lista: Lista) {
    val post = new Post(leo.mailDefault, "hola", "yeah")
    lista.enviar(post)
    EmailSenderMock.assertPost("se esperaban dos emails", 2, post)
    EmailSenderMock.clear()
  }

  def envioNoMiembro(lista: Lista) {
    val post = new Post("fulano@gmail.com", "hola", "yeah")
    lista.enviar(post)
    EmailSenderMock.assertPost("se esperaban tres emails", 3, post)
    EmailSenderMock.clear()
  }

}