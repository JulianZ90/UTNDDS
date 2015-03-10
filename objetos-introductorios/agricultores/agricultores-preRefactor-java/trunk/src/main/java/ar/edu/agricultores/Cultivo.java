package ar.edu.agricultores;

import java.util.ArrayList;
import java.util.List;

public abstract class Cultivo {

	List<Conservante> conservantes;
	
	public Cultivo() {
		conservantes = new ArrayList<Conservante>();	
	}
	
	// PUNTO 1
	public abstract double costo(int cantidadHectareasCultivadas);

	// PUNTO 2
	public boolean esSoja() {
		return false;
	}

}
