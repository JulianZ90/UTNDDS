package ar.edu.agricultores

import java.util.ArrayList
import java.util.List

abstract class Cultivo {
	
	@Property List<Conservante> conservantes
	
	new() {
		conservantes = new ArrayList<Conservante>	
	}
	
	def double costo(int cantidadHectareasCultivadas)

	def boolean esSoja() {
		false
	}
	
}