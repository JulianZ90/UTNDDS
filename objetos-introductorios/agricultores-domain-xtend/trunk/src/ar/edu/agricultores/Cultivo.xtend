package ar.edu.agricultores

abstract class Cultivo {
	
	def double costoPara(Parcela parcela) {
		this.costoBasePorHectarea(parcela) * parcela.hectareasCultivadas
	}
	
	def double costoBasePorHectarea(Parcela parcela)

	def double precioVentaPorKg(Parcela parcela) {
		20
	}
	
}