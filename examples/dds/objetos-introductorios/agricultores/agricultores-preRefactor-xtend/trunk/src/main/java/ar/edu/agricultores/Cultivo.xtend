package ar.edu.agricultores

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Cultivo {
	
	List<Conservante> conservantes
	
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