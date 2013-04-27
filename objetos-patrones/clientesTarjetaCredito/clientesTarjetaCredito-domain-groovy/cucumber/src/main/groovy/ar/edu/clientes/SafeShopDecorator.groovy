package ar.edu.clientes

import ar.edu.clientes.exception.BusinessException

class SafeShopDecorator {
	def cliente
	def montoMaximoSafeShop
	
	def comprar(monto) {
		if (monto > montoMaximoSafeShop) {
			throw new BusinessException("Ha excedido el monto máximo")
		}
		cliente.comprar(monto)
	}
	
	def getSaldo() {
		cliente.saldo
	}
}
