package ar.edu.clientes

abstract class AbstractCliente {

  def esMoroso(): Boolean = {
    saldo() > 0
  }
  
  def nombre() : String
  
  def saldo(): Int
  
  def comprar(monto: Int)

  def montoCredito(): Int

}