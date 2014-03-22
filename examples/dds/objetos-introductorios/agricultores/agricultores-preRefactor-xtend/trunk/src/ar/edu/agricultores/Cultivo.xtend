package ar.edu.agricultores

import java.util.ArrayList
import java.util.List

abstract class Cultivo {
	
	@Property List<Conservante> conservantes
	
	new() {
		conservantes = new ArrayList<Conservante>	
	}
	
	// PUNTO 1
	def double costo(int cantidadHectareasCultivadas)

	// PUNTO 2
	def boolean esSoja() {
		false
	}
	
}