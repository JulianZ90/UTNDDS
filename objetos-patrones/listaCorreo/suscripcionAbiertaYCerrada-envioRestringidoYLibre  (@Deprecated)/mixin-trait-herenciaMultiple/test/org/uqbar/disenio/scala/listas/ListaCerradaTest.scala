package org.uqbar.disenio.scala.listas
import org.junit.Test
import org.junit.Assert
import org.junit.Before

class ListaCerradaTest {

  var listaCerradaLibre:ListaCerradaLibre  = null;
  var listaCerradaRestringida:ListaCerradaRestringida = null;
  var leo:Miembro = null;
  
  @Before
  def before() {
    listaCerradaLibre = new ListaCerradaLibre;
    listaCerradaRestringida = new ListaCerradaRestringida();
    leo = new Miembro("lgassman@gmail.com");
  }
  
  
  @Test
  def testAprobar() {
	  aprobar(listaCerradaRestringida);
	  aprobar(listaCerradaLibre);
  }
  
  @Test
  def testRechazar() {
	  rechazar(listaCerradaRestringida);
	  rechazar(listaCerradaLibre);
  }

  def aprobar(lista:Cerrada) {
	  lista.suscribir(leo);
	  Assert.assertFalse(lista.miembros.contains(leo));    
	  Assert.assertTrue(lista.miembrosPendientes.contains(leo));    
	  lista.aprobar(leo);
	  Assert.assertTrue(lista.miembros.contains(leo));    
	  Assert.assertFalse(lista.miembrosPendientes.contains(leo));    
  }
  
  def rechazar(lista:Cerrada) {
	  lista.suscribir(leo);
	  Assert.assertFalse(lista.miembros.contains(leo));    
	  Assert.assertTrue(lista.miembrosPendientes.contains(leo));    
	  lista.rechazar(leo);
	  Assert.assertFalse(lista.miembros.contains(leo));    
	  Assert.assertFalse(lista.miembrosPendientes.contains(leo));    
  }
}