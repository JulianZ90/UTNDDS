package ar.edu.clientes

class ClienteSafeShop(pSaldo: Int, pMaximoCompra: Int) extends Cliente(pSaldo) with SafeShop {

      override val maximoCompra = pMaximoCompra

      override def comprar(monto: Int) {
        super[SafeShop].comprar(monto)
        super[Cliente].comprar(monto)
      }

}