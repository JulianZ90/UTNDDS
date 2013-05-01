package ar.edu.clientes

import ar.edu.clientes.exceptions.BusinessException

trait SafeShop extends Comprador {
    val maximoCompra: Int
    
	abstract override def comprar(monto: Int) = {
	  if (monto > maximoCompra) {
		throw new BusinessException("Monto máximo excedido")
	  }
	  super.comprar(monto)
    }
	
}