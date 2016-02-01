package ar.edu.clientes

abstract class AbstractClienteDecorator(pCliente: AbstractCliente) extends AbstractCliente {

  var cliente = pCliente

  override def nombre(): String = {
    cliente.nombre + "(" + this.decoracion + ")"
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

  def decoracion() : String
  
}