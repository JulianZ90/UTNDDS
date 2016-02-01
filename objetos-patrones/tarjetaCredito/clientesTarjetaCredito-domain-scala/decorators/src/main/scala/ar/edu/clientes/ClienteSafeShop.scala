package ar.edu.clientes

import ar.edu.clientes.exceptions.BusinessException

class ClienteSafeShop(pCliente: AbstractCliente, montoMaximo: Int) extends AbstractClienteDecorator(pCliente) {

  override def comprar(monto: Int) = {
    if (monto > montoMaximo) {
      throw new BusinessException("El monto de la compra " + monto + " supera el máximo definido para compra segura (" + montoMaximo + ")")
    }
    cliente.comprar(monto)
  }

  override def montoCredito(): Int = {
    return montoMaximo
  }

  override def decoracion(): String = {
    "Safe Shop"
  }

}