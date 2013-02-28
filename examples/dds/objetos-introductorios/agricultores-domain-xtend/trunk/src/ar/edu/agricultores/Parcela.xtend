package ar.edu.agricultores

class Parcela {
	
	@Property int hectareas
	@Property Cultivo cultivo
	@Property int hectareasCultivadas
	@Property int cantidadEnSilo
	
	new(int pHectareas, Cultivo pCultivo) {
		hectareas = pHectareas
		hectareasCultivadas = pHectareas  // por default cultivamos todos
		cultivo = pCultivo
	}
	
	def double getCostoTotal() {
		cultivo.costoPara(this)
	}
	
	def boolean sujetaARetencion() {
		hectareas > 1000
	}
	
	def double precioVenta() {
		cultivo.precioVentaPorKg(this)
	}
	
}