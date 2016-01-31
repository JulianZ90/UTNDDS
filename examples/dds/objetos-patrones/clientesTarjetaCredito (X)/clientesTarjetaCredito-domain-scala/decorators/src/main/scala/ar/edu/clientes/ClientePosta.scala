package ar.edu.clientes

import ar.edu.clientes.exceptions.BusinessException

class ClientePosta(pNombre : String, pSaldo : Int) extends AbstractCliente {

  var nombre: String = pNombre
  var saldo: Int = pSaldo

  override def comprar(monto: Int) = {
    if (monto > saldo) {
      throw new BusinessException("El monto de la compra " + monto + " supera el saldo (" + saldo + ")")
    }
    saldo = saldo - monto
  }

  override def montoCredito() : Int = {
    saldo 
  }

}