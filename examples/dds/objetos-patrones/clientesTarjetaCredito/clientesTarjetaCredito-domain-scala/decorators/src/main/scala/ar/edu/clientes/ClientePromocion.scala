package ar.edu.clientes

class ClientePromocion(pCliente: AbstractCliente) extends AbstractClienteDecorator(pCliente) {

  var puntosAcumulados: Int = 0

  override def comprar(monto: Int) = {
    cliente.comprar(monto)
    if (monto > 15) {
      puntosAcumulados = puntosAcumulados + 50
    }
  }

  override def decoracion(): String = {
    "Promoción"
  }

}