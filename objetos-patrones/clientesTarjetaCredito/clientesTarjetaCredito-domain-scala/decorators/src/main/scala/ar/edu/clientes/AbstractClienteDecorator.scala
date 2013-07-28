package ar.edu.clientes

class AbstractClienteDecorator(pCliente: AbstractCliente) extends AbstractCliente {

  var cliente = pCliente

  override def nombre(): String = {
    cliente.nombre
  }
  
  override def saldo(): Int = {
    cliente.saldo
  }

  override def comprar(monto: Int) = {
    cliente.comprar(monto)
  }

  override def montoCredito(): Int = {
    cliente.montoCredito
  }

}