package org.uqbar.disenio.scala.listas
import org.junit.Test
import org.junit.Assert
import org.junit.Before

class ListaAbiertaLibreTest {

  val listaAbiertaLibre = new ListaAbiertaLibre();
  val listaAbiertaRestringida = new ListaAbiertaRestringida();
  val leo = new Miembro("lgassman@gmail.com");

  @Test
  def testSuscripcion() {
    probar(listaAbiertaRestringida);
    probar(listaAbiertaLibre);

  }

  def probar(lista: Lista) {
    lista.suscribir(leo);
    Assert.assertTrue(lista.miembros.contains(leo));
  }
}