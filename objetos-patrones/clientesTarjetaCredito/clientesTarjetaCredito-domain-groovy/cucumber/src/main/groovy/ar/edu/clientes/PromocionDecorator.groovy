package ar.edu.clientes

class PromocionDecorator {
	def cliente
	def puntos = 0
	
	def comprar(monto) {
		cliente.comprar(monto)
		if (monto > 50) {
			puntos += 15
		}
	}
	
	
	def getSaldo() {
		cliente.saldo
	}
}
