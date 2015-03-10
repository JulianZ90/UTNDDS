package ar.edu.agricultores

import ar.edu.agricultores.Cultivo

class Sorgo extends Cultivo {

	override String toString() {
		"Sorgo"
	}

	// PUNTO 1
	override costo(int cantidadHectareasCultivadas) {
		if (cantidadHectareasCultivadas < 50) {
			3 * cantidadHectareasCultivadas
		} else {
			2 * cantidadHectareasCultivadas
		}
	}

}
