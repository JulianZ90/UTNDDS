package ar.edu.tarjetaCreditoDecorator

interface Cliente {

	def void comprar(int monto)
	def void pagarVencimiento(int monto)
	def boolean esMoroso()
	def int getSaldo()
	def int getPuntos()
}