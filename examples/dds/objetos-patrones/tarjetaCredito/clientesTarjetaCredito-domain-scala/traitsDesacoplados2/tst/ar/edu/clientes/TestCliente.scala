package ar.edu.clientes

import org.junit.Before
import org.junit.Test
import ar.edu.clientes.exceptions.BusinessException
import org.junit.Assert

class TestCliente {

  var franquito: Cliente = null
  var franquitoConNovia: Cliente = null
  var franquitoEnPromo: Cliente with Promocion = null

  @Before
  def init() {
    franquito = new Cliente(60)
    franquitoConNovia = new ClienteSafeShop(60, 20)
    franquitoEnPromo = new Cliente(60) with Promocion {

      override def comprar(monto: Int) {
        super[Cliente].comprar(monto)
        super[Promocion].comprar(monto)
      }

    }
  }

  @Test
  def franquitoSinNoviaPuedeComprarPor30() {
    franquito.comprar(30)
  }

  @Test(expected = classOf[BusinessException])
  def franquitoConNoviaNoPuedeComprarPor30() {
    franquitoConNovia.comprar(30)
  }

  @Test
  def franquitoEnPromoCompraPor60() {
    franquitoEnPromo.comprar(60)
    Assert.assertEquals(15, franquitoEnPromo.puntosAcumulados)
  }

}