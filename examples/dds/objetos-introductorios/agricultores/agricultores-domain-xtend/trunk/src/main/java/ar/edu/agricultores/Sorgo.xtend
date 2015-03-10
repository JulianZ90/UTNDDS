package ar.edu.agricultores

import ar.edu.agricultores.Cultivo

class Sorgo extends Cultivo {
	
	override String toString() {
		"Sorgo"	
	}
	
	// PUNTO 1
	override costoBasePorHectarea(Parcela parcela) {
		if (parcela.hectareasCultivadas < 50) { 
			3 
		} else {
			2
		}
	}

}