package ar.edu.clientes

import ar.edu.clientes.exceptions.BusinessException

trait SafeShop {
    val maximoCompra: Int
    
	def comprar(monto: Int) = 
	  if (monto > maximoCompra) {
		throw new BusinessException("Monto máximo excedido")
	  }
	
}