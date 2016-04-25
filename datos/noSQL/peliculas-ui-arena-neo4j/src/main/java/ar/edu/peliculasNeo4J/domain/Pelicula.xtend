package ar.edu.peliculasNeo4J.domain

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Pelicula {
	Long id
	String titulo
	String frase
	int anio
	List<Personaje> personajes = new ArrayList<Personaje>
	
	override toString() {
		titulo + " (" + anio + ")" 
	}
	
	def agregarPersonaje(String _roles, Actor _actor) {
		personajes.add(new Personaje => [
			roles = #[_roles]
			actor = _actor
		])
	}
	
}