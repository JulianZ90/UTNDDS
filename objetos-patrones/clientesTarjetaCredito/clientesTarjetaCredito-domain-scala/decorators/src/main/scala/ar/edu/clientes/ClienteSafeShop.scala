package ar.edu.clientes

import ar.edu.clientes.exceptions.BusinessException

class ClienteSafeShop(pCliente : AbstractCliente, montoMaximo: Int) extends AbstractClienteDecorator(pCliente) {

  override def comprar(monto: Int) = {
    if (monto > montoMaximo) {
      throw new BusinessException("El monto de la compa " + monto + " supera el máximo (" + montoMaximo + ")")
    }
    cliente.comprar(monto)
  }

}