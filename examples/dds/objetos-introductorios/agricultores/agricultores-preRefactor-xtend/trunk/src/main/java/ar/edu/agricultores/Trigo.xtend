package ar.edu.agricultores

class Trigo extends Cultivo {

	override String toString() {
		"Trigo"
	}
	
	def agregarConservante(Conservante conservante) {
		conservantes.add(conservante)
	}

	// PUNTO 1
	override costo(int cantidadHectareasCultivadas) {
		if (cantidadHectareasCultivadas * 5 > 500) {
			500
		} else {
			cantidadHectareasCultivadas * 5
		}
	}

}
