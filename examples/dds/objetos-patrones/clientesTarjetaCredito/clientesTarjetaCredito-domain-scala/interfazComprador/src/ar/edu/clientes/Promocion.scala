package ar.edu.clientes

import ar.edu.clientes.exceptions.BusinessException

trait Promocion extends Comprador {
  var puntosAcumulados = 0

  abstract override def comprar(monto: Int) = {
    super.comprar(monto)
    if (monto > montoMinimo) {
      puntosAcumulados += puntosPromocion
    }
  }

  def montoMinimo(): Int = 50
  
  def puntosPromocion(): Int = 15
  
}

