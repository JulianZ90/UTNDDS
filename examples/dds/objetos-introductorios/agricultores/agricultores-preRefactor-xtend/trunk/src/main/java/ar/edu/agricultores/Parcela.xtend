package ar.edu.agricultores

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Parcela {

	int hectareas
	Cultivo cultivo
	int hectareasCultivadas
	int cantidadEnSilo

	new(int pHectareas, Cultivo pCultivo) {
		hectareas = pHectareas
		hectareasCultivadas = pHectareas // por default cultivamos todos
		cultivo = pCultivo
	}

	// PUNTO 1
	def double getCostoTotal() {
		cultivo.costo(hectareasCultivadas)
	}

	// PUNTO 2
	def double precioVenta() {
		if (cultivo.esSoja()) { // Soja y SojaTransgenica devuelven true
			(cultivo as Soja).precioVenta(cultivo.costo(hectareasCultivadas), hectareas, 10d, 0.1, 1000)
		} else {
			val costoConservantes = cultivo.conservantes.fold(0d, [acum, conservante|acum + conservante.precio])
			// en cada parcela guardamos los conservantes,
			// si el cultivo es trigo tiene conservantes
			// si el cultivo es sorgo hay una colección vacía
			20 - costoConservantes
		}
	}

}
