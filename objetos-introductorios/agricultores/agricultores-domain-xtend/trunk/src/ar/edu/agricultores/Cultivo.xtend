package ar.edu.agricultores

abstract class Cultivo {
	
	override boolean equals(Object object) {
		toString.equals(object.toString)	
	}
	
	override int hashCode() {
		toString.hashCode
	}
	
	// PUNTO 1
	def double costoPara(Parcela parcela) {
		this.costoBasePorHectarea(parcela) * parcela.hectareasCultivadas
	}
	
	def double costoBasePorHectarea(Parcela parcela)

	// PUNTO 2
	def double precioVentaPorKg(Parcela parcela) {
		20
	}
	
}