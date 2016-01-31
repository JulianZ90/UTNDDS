package ar.edu.clientes

import ar.edu.clientes.exceptions.BusinessException

trait Promocion {
  var puntosAcumulados = 0

  def comprar(monto: Int) =
    if (monto > montoMinimo) {
      puntosAcumulados += puntosPromocion
    }

  def montoMinimo(): Int = 50
  
  def puntosPromocion(): Int = 15
  
}

