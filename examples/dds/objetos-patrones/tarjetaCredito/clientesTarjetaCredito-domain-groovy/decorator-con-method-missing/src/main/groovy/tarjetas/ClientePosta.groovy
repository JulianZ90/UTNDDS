package tarjetas

class ClientePosta {
  def saldo, puntosAcumulados = 0

  def comprar(monto) {
    saldo -= monto
  }

  def sumarPuntos(cantidad) {
    puntosAcumulados += cantidad
  }
}
