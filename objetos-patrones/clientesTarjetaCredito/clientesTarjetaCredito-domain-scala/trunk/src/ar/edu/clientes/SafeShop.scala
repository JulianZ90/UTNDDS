package ar.edu.clientes

import ar.edu.clientes.exceptions.BusinessException

trait SafeShop extends Cliente {
    val maximoCompra: Int
    
	override def comprar(monto: Int) = {
	  if (monto > maximoCompra) {
		throw new BusinessException("Monto máximo excedido")
	  }
	  super.comprar(monto)
    }
	
}