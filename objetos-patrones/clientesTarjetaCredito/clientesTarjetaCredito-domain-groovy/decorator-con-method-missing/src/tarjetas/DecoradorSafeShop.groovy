package tarjetas

class DecoradorSafeShop extends DecoradorAbstracto {
  def limite

  def comprar(monto) {
    assert monto <= limite, "El monto debe ser menor o igual al limite"
    decorado.comprar(monto)
  }
}
