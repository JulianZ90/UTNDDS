package ar.edu.agricultores

import ar.edu.agricultores.Cultivo

class Sorgo extends Cultivo {

	override costo(int cantidadHectareasCultivadas) {
		if (cantidadHectareasCultivadas < 50) {
			3 * cantidadHectareasCultivadas
		} else {
			2 * cantidadHectareasCultivadas
		}
	}

	override String toString() {
		"Sorgo"
	}

}
