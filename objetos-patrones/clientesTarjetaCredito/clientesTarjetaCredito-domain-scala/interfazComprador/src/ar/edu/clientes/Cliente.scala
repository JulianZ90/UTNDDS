package ar.edu.clientes

class Cliente(pSaldo: Int) extends Comprador {
  
	var nombre: String = ""
	var saldo: Int = pSaldo
	
	def comprar(monto: Int) {
	  	saldo -= monto
	}
	
}
