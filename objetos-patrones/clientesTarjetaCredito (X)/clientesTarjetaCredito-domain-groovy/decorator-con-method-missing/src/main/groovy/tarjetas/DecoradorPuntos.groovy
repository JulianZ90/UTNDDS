package tarjetas

class DecoradorPuntos extends DecoradorAbstracto {
  def comprar(monto) {
    decorado.comprar(monto)
    if(monto>10) {
      decorado.sumarPuntos(monto)
    }
  }
}
