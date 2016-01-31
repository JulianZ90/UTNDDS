package ar.edu.clientes

class Cliente {
	def saldo
	
	def comprar(monto) {
		saldo -= monto
	}

}
