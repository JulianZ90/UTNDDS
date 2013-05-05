package tarjetas

import org.junit.Before
import org.junit.Ignore
import org.junit.Test

import tarjetas.ClientePosta;
import tarjetas.DecoradorPuntos;
import tarjetas.DecoradorSafeShop;


class TestDriver {
  def jose, joseConSafeShop, joseConPuntos, joseConPuntosYSafeShop

  @Before
  void init() {
    jose = new ClientePosta(saldo: 40)
    joseConSafeShop = new DecoradorSafeShop(decorado: jose, limite: 20)
    joseConPuntos = new DecoradorPuntos(decorado: jose)
    joseConPuntosYSafeShop = new DecoradorPuntos(decorado: joseConSafeShop)
  }

  @Test
  void "comprar en cliente comun disminuye el saldo"() {
    jose.comprar(25)
    assert 15 == jose.saldo
  }

  @Test(expected=AssertionError)
  void "no se puede comprar en cliente safe shop excediendo el limite"() {
    joseConSafeShop.comprar(25)
  }

  @Test
  void "se puede comprar con cliente safe shop si no se excede el límite"() {
    joseConSafeShop.comprar(15)
    assert 25 == jose.saldo
  }

  @Test
  void "comprar con sistemas de puntos por encima de 10 da puntos"() {
    joseConPuntos.comprar(120)
    assert 120 == jose.puntosAcumulados
  }

  @Test
  void "se puede combinar safe shop con sistema de puntos"() {
    joseConPuntosYSafeShop.comprar(15)
    assert 15 == jose.puntosAcumulados
  }
}