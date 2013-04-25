package ar.edu.clientes

import ar.edu.clientes.exception.BusinessException

class SafeShopDecorator {
	def decorado
	def montoMaximoSafeShop
	
	def comprar(monto) {
		if (monto > montoMaximoSafeShop) {
			throw new BusinessException("Ha excedido el monto máximo")
		}
	}
	
}
