package ar.edu.agricultores

class Parcela {

	@Property int hectareas
	@Property Cultivo cultivo
	@Property int hectareasCultivadas
	@Property int cantidadEnSilo

	new(int pHectareas, Cultivo pCultivo) {
		hectareas = pHectareas
		hectareasCultivadas = pHectareas // por default cultivamos todos
		cultivo = pCultivo
	}

	// PUNTO 1
	def double getCostoTotal() {
		cultivo.costoPara(this)
	}

	def boolean sujetaARetencion() {
		hectareas > 1000
	}

	// PUNTO 2
	def double precioVenta() {
		cultivo.precioVentaPorKg(this)
	}
	
	// PUNTO 5
	def estaSubutilizada() {
		hectareasCultivadas / hectareas < 0.5 
	}

}
