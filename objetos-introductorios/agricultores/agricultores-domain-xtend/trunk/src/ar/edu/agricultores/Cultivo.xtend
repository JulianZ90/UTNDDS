package ar.edu.agricultores

abstract class Cultivo {
	
	def double costoPara(Parcela parcela) {
		this.costoBasePorHectarea(parcela) * parcela.hectareasCultivadas
	}
	
	def double costoBasePorHectarea(Parcela parcela)

	def double precioVentaPorKg(Parcela parcela) {
		20
	}
	
	override String toString() {
		this.getClass().canonicalName	
	}
	
	override boolean equals(Object object) {
		toString.equals(object.toString)	
	}
	
	override int hashCode() {
		toString.hashCode
	}
	
}