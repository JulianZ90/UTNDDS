package tarjetas

class DecoradorAbstracto {
  def decorado
  def methodMissing(String selector, parametros) {
    decorado."$selector"(*parametros)
  }
}
