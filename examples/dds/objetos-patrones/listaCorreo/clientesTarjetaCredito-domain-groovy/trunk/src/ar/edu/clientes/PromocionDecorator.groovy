package ar.edu.clientes

class PromocionDecorator {
	def decorado
	def puntos
	
	def comprar(monto) {
		decorado.comprar(monto)
		if (monto > 50) {
			puntos += 15
		}
	}
	
}
